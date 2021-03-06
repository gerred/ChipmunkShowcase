/* Copyright (c) 2012 Scott Lembcke and Howling Moon Software
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import "ShowcaseDemo.h"
#import "ChipmunkHastySpace.h"


@interface PlanetoidBody : ChipmunkBody

@property(nonatomic, assign) cpFloat gravity;

@end


// In order to provide the planetary gravity, I'm going to make a ChipmunkSpace subclass to
// track the planetoids (things big enough to have gravity). Then the satellites can ask the
// space what gravity for them should be.

// If you are going to override ChipmunkSpace, you should override ChipmunkHastySpace instead.
// It's the ARM/multicore accelerated version of ChipmunkSpace provided by ChipmunkPro.
@interface SolarSystemSpace : ChipmunkHastySpace

@property(nonatomic, readonly) NSMutableArray *planetoids;

@end


@implementation SolarSystemSpace {
@protected
	NSMutableArray *_planetoids;
}

@synthesize planetoids = _planetoids;

-(id)init
{
	if((self = [super init])){
		_planetoids = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(cpVect)gravityAt:(cpVect)pos
{
	cpVect g = cpvzero;
	
	// Loop over all the planetoids and add their gravities together.
	for(PlanetoidBody *planetoid in _planetoids){
		cpVect delta = cpvsub(pos, planetoid.pos);
		cpFloat sqdist = cpvlengthsq(delta);
		g = cpvadd(g, cpvmult(delta, -planetoid.gravity/(sqdist*cpfsqrt(sqdist))));
	}
	
	return g;
}


@end


@implementation PlanetoidBody {
@public
	cpFloat _gravity;
}

@synthesize gravity = _gravity;

-(id)initWithGravity:(cpFloat)gravity;
{
	if((self = [super initWithMass:INFINITY andMoment:INFINITY])){
		_gravity = gravity;
	}
	
	return self;
}

-(void)addToSpace:(SolarSystemSpace *)space
{
	[super addToSpace:space];
	[space.planetoids addObject:self];
}

-(void)removeFromSpace:(SolarSystemSpace *)space
{
	[space.planetoids removeObject:self];
	[super removeFromSpace:space];
}

@end


@interface SatelliteBody : ChipmunkBody @end
@implementation SatelliteBody

static void
SatelliteBodyVelocityFunc(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt)
{
	// The ChipmunkSpace object reference is stored in the user data pointer of the space.
	// Use that to recalculate the fancy multi-planet gravity for us.
	SolarSystemSpace *space = cpSpaceGetUserData(cpBodyGetSpace(body));
	gravity = [space gravityAt:cpBodyGetPos(body)];
	
	cpBodyUpdateVelocity(body, gravity, damping, dt);
}

-(id)initWithMass:(cpFloat)mass andMoment:(cpFloat)moment
{
	if((self = [super initWithMass:mass andMoment:moment])){
		self.body->velocity_func = SatelliteBodyVelocityFunc;
	}
	
	return self;
}

@end


// Now actually implement the demo. \o/
@interface SolarSystemDemo : ShowcaseDemo @end
@implementation SolarSystemDemo {
	ChipmunkBody *_planetBody;
	ChipmunkBody *_moonBody;
}

-(NSString *)name
{
	return @"Solar System";
}

-(Class)spaceClass
{
	return [SolarSystemSpace class];
}

static cpVect
rand_pos()
{
	cpVect v;
	do {
		v = cpvmult(frand_unit_circle(), 500);
	} while(cpvlength(v) < 100.0f);
	
	return v;
}

-(void)addBall
{
	const cpFloat radius = 5.0f;
	const cpFloat mass = 1.0f;
	
	ChipmunkBody *body = [self.space add:[SatelliteBody bodyWithMass:mass andMoment:cpMomentForCircle(mass, 0.0, radius, cpvzero)]];
	body.pos = rand_pos();
	
	ChipmunkShape *shape = [self.space add:[ChipmunkCircleShape circleWithBody:body radius:radius offset:cpvzero]];
	shape.elasticity = 0.0f;
	shape.friction = 0.7f;
}

static const cpFloat MoonOrbitDist = 240.0;

-(void)setup
{
	{
		// Normally you don't add infinite mass bodies to a space, but in this case it's ok because "regular" gravity is 0.
		// This makes for a convenient way to add the planetoids to the space's list anyway.
		// This also allows us to animate the planetoids by modifying their velocities and letting the space take care of the rest.
		_planetBody = [self.space add:[[PlanetoidBody alloc] initWithGravity:5e6]];
		_planetBody.angVel = -2.0;
		
		ChipmunkShape *shape = [self.space add:[ChipmunkCircleShape circleWithBody:_planetBody radius:70.0f offset:cpvzero]];
		shape.elasticity = 1.0f;
		shape.friction = 1.0f;
		shape.layers = NOT_GRABABLE_MASK;
	}
	
	{
		_moonBody = [self.space add:[[PlanetoidBody alloc] initWithGravity:1e6]];
		_moonBody.pos = cpv(MoonOrbitDist, 0.0);
		_moonBody.angVel = -5.0;
		
		ChipmunkShape *shape = [self.space add:[ChipmunkCircleShape circleWithBody:_moonBody radius:20.0f offset:cpvzero]];
		shape.elasticity = 1.0f;
		shape.friction = 1.0f;
		shape.layers = NOT_GRABABLE_MASK;
	}
	
	NSUInteger count = [self numberForA4:250 A5:400];
	for(int i=0; i < count; i++) [self addBall];
}

// Manually animate the moon's position.
-(void)tick:(cpFloat)dt
{
	cpVect pos = cpvmult(cpvforangle(self.fixedTime*1.0), MoonOrbitDist);
	_moonBody.vel = cpvmult(cpvsub(pos, _moonBody.pos), 1.0/dt);
	// Don't set the position, the space will do that as it updates the moon body.
	
	[super tick:dt];
}

@end
