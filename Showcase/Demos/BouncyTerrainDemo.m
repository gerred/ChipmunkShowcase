#import "ShowcaseDemo.h"

@interface BouncyTerrainDemo : ShowcaseDemo @end
@implementation BouncyTerrainDemo

-(NSString *)name
{
	return @"Bouncy Terrain";
}

static cpVect bouncy_terrain_verts[] = {
	{537.18,  23.00}, {520.50,  36.00}, {501.53,  63.00}, {496.14,  76.00}, {498.86,  86.00}, {504.00,  90.51}, {508.00,  91.36}, {508.77,  84.00}, {513.00,  77.73}, {519.00,  74.48}, {530.00,  74.67}, {545.00,  54.65},
	{554.00,  48.77}, {562.00,  46.39}, {568.00,  45.94}, {568.61,  47.00}, {567.94,  55.00}, {571.27,  64.00}, {572.92,  80.00}, {572.00,  81.39}, {563.00,  79.93}, {556.00,  82.69}, {551.49,  88.00}, {549.00,  95.76},
	{538.00,  93.40}, {530.00, 102.38}, {523.00, 104.00}, {517.00, 103.02}, {516.22, 109.00}, {518.96, 116.00}, {526.00, 121.15}, {534.00, 116.48}, {543.00, 116.77}, {549.28, 121.00}, {554.00, 130.17}, {564.00, 125.67},
	{575.60, 129.00}, {573.31, 121.00}, {567.77, 111.00}, {575.00, 106.47}, {578.51, 102.00}, {580.25,  95.00}, {577.98,  87.00}, {582.00,  85.71}, {597.00,  89.46}, {604.80,  95.00}, {609.28, 104.00}, {610.55, 116.00},
	{609.30, 125.00}, {600.80, 142.00}, {597.31, 155.00}, {584.00, 167.23}, {577.86, 175.00}, {583.52, 184.00}, {582.64, 195.00}, {591.00, 196.56}, {597.81, 201.00}, {607.45, 219.00}, {607.51, 246.00}, {600.00, 275.46},
	{588.00, 267.81}, {579.00, 264.91}, {557.00, 264.41}, {552.98, 259.00}, {548.00, 246.18}, {558.00, 247.12}, {565.98, 244.00}, {571.10, 237.00}, {571.61, 229.00}, {568.25, 222.00}, {562.00, 217.67}, {544.00, 213.93},
	{536.73, 214.00}, {535.60, 204.00}, {539.69, 181.00}, {542.84, 171.00}, {550.43, 161.00}, {540.00, 156.27}, {536.62, 152.00}, {534.70, 146.00}, {527.00, 141.88}, {518.59, 152.00}, {514.51, 160.00}, {510.33, 175.00},
	{519.38, 183.00}, {520.52, 194.00}, {516.00, 201.27}, {505.25, 206.00}, {507.57, 223.00}, {519.90, 260.00}, {529.00, 260.48}, {534.00, 262.94}, {538.38, 268.00}, {540.00, 275.00}, {537.06, 284.00}, {530.00, 289.23},
	{520.00, 289.23}, {513.00, 284.18}, {509.71, 286.00}, {501.69, 298.00}, {501.56, 305.00}, {504.30, 311.00}, {512.00, 316.43}, {521.00, 316.42}, {525.67, 314.00}, {535.00, 304.98}, {562.00, 294.80}, {573.00, 294.81},
	{587.52, 304.00}, {600.89, 310.00}, {596.96, 322.00}, {603.28, 327.00}, {606.52, 333.00}, {605.38, 344.00}, {597.65, 352.00}, {606.36, 375.00}, {607.16, 384.00}, {603.40, 393.00}, {597.00, 398.14}, {577.00, 386.15},
	{564.35, 373.00}, {565.21, 364.00}, {562.81, 350.00}, {553.00, 346.06}, {547.48, 338.00}, {547.48, 330.00}, {550.00, 323.30}, {544.00, 321.53}, {537.00, 322.70}, {532.00, 326.23}, {528.89, 331.00}, {527.83, 338.00},
	{533.02, 356.00}, {542.00, 360.73}, {546.68, 369.00}, {545.38, 379.00}, {537.58, 386.00}, {537.63, 388.00}, {555.00, 407.47}, {563.00, 413.52}, {572.57, 418.00}, {582.72, 426.00}, {578.00, 431.12}, {563.21, 440.00},
	{558.00, 449.27}, {549.00, 452.94}, {541.00, 451.38}, {536.73, 448.00}, {533.00, 441.87}, {520.00, 437.96}, {514.00, 429.69}, {490.00, 415.15}, {472.89, 399.00}, {472.03, 398.00}, {474.00, 396.71}, {486.00, 393.61},
	{492.00, 385.85}, {492.00, 376.15}, {489.04, 371.00}, {485.00, 368.11}, {480.00, 376.27}, {472.00, 379.82}, {463.00, 378.38}, {455.08, 372.00}, {446.00, 377.69}, {439.00, 385.24}, {436.61, 391.00}, {437.52, 404.00},
	{440.00, 409.53}, {463.53, 433.00}, {473.80, 441.00}, {455.00, 440.30}, {443.00, 436.18}, {436.00, 431.98}, {412.00, 440.92}, {397.00, 442.46}, {393.59, 431.00}, {393.71, 412.00}, {400.00, 395.10}, {407.32, 387.00},
	{408.54, 380.00}, {407.42, 375.00}, {403.97, 370.00}, {399.00, 366.74}, {393.00, 365.68}, {391.23, 374.00}, {387.00, 380.27}, {381.00, 383.52}, {371.56, 384.00}, {364.98, 401.00}, {362.96, 412.00}, {363.63, 435.00},
	{345.00, 433.55}, {344.52, 442.00}, {342.06, 447.00}, {337.00, 451.38}, {330.00, 453.00}, {325.00, 452.23}, {318.00, 448.17}, {298.00, 453.70}, {284.00, 451.49}, {278.62, 449.00}, {291.47, 408.00}, {291.77, 398.00},
	{301.00, 393.83}, {305.00, 393.84}, {305.60, 403.00}, {310.00, 409.47}, {318.00, 413.07}, {325.00, 412.40}, {332.31, 407.00}, {335.07, 400.00}, {334.40, 393.00}, {329.00, 385.69}, {319.00, 382.79}, {301.00, 389.23},
	{289.00, 389.97}, {265.00, 389.82}, {251.00, 385.85}, {245.00, 389.23}, {239.00, 389.94}, {233.00, 388.38}, {226.00, 382.04}, {206.00, 374.75}, {206.00, 394.00}, {204.27, 402.00}, {197.00, 401.79}, {191.00, 403.49},
	{186.53, 407.00}, {183.60, 412.00}, {183.60, 422.00}, {189.00, 429.31}, {196.00, 432.07}, {203.00, 431.40}, {209.47, 427.00}, {213.00, 419.72}, {220.00, 420.21}, {227.00, 418.32}, {242.00, 408.41}, {258.98, 409.00},
	{250.00, 435.43}, {239.00, 438.78}, {223.00, 448.19}, {209.00, 449.70}, {205.28, 456.00}, {199.00, 460.23}, {190.00, 460.52}, {182.73, 456.00}, {178.00, 446.27}, {160.00, 441.42}, {148.35, 435.00}, {149.79, 418.00},
	{157.72, 401.00}, {161.00, 396.53}, {177.00, 385.00}, {180.14, 380.00}, {181.11, 374.00}, {180.00, 370.52}, {170.00, 371.68}, {162.72, 368.00}, {158.48, 361.00}, {159.56, 349.00}, {154.00, 342.53}, {146.00, 339.85},
	{136.09, 343.00}, {130.64, 351.00}, {131.74, 362.00}, {140.61, 374.00}, {130.68, 387.00}, {120.75, 409.00}, {118.09, 421.00}, {117.92, 434.00}, {100.00, 432.40}, { 87.00, 427.48}, { 81.59, 423.00}, { 73.64, 409.00},
	{ 72.57, 398.00}, { 74.62, 386.00}, { 78.80, 378.00}, { 88.00, 373.43}, { 92.49, 367.00}, { 93.32, 360.00}, { 91.30, 353.00}, {103.00, 342.67}, {109.00, 343.10}, {116.00, 340.44}, {127.33, 330.00}, {143.00, 327.24},
	{154.30, 322.00}, {145.00, 318.06}, {139.77, 311.00}, {139.48, 302.00}, {144.95, 293.00}, {143.00, 291.56}, {134.00, 298.21}, {118.00, 300.75}, {109.40, 305.00}, { 94.67, 319.00}, { 88.00, 318.93}, { 81.00, 321.69},
	{ 67.24, 333.00}, { 56.68, 345.00}, { 53.00, 351.40}, { 47.34, 333.00}, { 50.71, 314.00}, { 56.57, 302.00}, { 68.00, 287.96}, { 91.00, 287.24}, {110.00, 282.36}, {133.80, 271.00}, {147.34, 256.00}, {156.47, 251.00},
	{157.26, 250.00}, {154.18, 242.00}, {154.48, 236.00}, {158.72, 229.00}, {166.71, 224.00}, {170.15, 206.00}, {170.19, 196.00}, {167.24, 188.00}, {160.00, 182.67}, {150.00, 182.66}, {143.60, 187.00}, {139.96, 195.00},
	{139.50, 207.00}, {136.45, 221.00}, {136.52, 232.00}, {133.28, 238.00}, {129.00, 241.38}, {119.00, 243.07}, {115.00, 246.55}, {101.00, 253.16}, { 86.00, 257.32}, { 63.00, 259.24}, { 57.00, 257.31}, { 50.54, 252.00},
	{ 47.59, 247.00}, { 46.30, 240.00}, { 47.58, 226.00}, { 50.00, 220.57}, { 58.00, 226.41}, { 69.00, 229.17}, { 79.00, 229.08}, { 94.50, 225.00}, {100.21, 231.00}, {107.00, 233.47}, {107.48, 224.00}, {109.94, 219.00},
	{115.00, 214.62}, {122.57, 212.00}, {116.00, 201.49}, {104.00, 194.57}, { 90.00, 194.04}, { 79.00, 198.21}, { 73.00, 198.87}, { 62.68, 191.00}, { 62.58, 184.00}, { 64.42, 179.00}, { 75.00, 167.70}, { 80.39, 157.00},
	{ 68.79, 140.00}, { 61.67, 126.00}, { 61.47, 117.00}, { 64.43, 109.00}, { 63.10,  96.00}, { 56.48,  82.00}, { 48.00,  73.88}, { 43.81,  66.00}, { 43.81,  56.00}, { 50.11,  46.00}, { 59.00,  41.55}, { 71.00,  42.64},
	{ 78.00,  36.77}, { 83.00,  34.75}, { 99.00,  34.32}, {117.00,  38.92}, {133.00,  55.15}, {142.00,  50.70}, {149.74,  51.00}, {143.55,  68.00}, {153.28,  74.00}, {156.23,  79.00}, {157.00,  84.00}, {156.23,  89.00},
	{153.28,  94.00}, {144.58,  99.00}, {151.52, 112.00}, {151.51, 124.00}, {150.00, 126.36}, {133.00, 130.25}, {126.71, 125.00}, {122.00, 117.25}, {114.00, 116.23}, {107.73, 112.00}, {104.48, 106.00}, {104.32,  99.00},
	{106.94,  93.00}, {111.24,  89.00}, {111.60,  85.00}, {107.24,  73.00}, {102.00,  67.57}, { 99.79,  67.00}, { 99.23,  76.00}, { 95.00,  82.27}, { 89.00,  85.52}, { 79.84,  86.00}, { 86.73, 114.00}, { 98.00, 136.73},
	{ 99.00, 137.61}, {109.00, 135.06}, {117.00, 137.94}, {122.52, 146.00}, {122.94, 151.00}, {121.00, 158.58}, {134.00, 160.97}, {153.00, 157.45}, {171.30, 150.00}, {169.06, 142.00}, {169.77, 136.00}, {174.00, 129.73},
	{181.46, 126.00}, {182.22, 120.00}, {182.20, 111.00}, {180.06, 101.00}, {171.28,  85.00}, {171.75,  80.00}, {182.30,  53.00}, {189.47,  50.00}, {190.62,  38.00}, {194.00,  33.73}, {199.00,  30.77}, {208.00,  30.48},
	{216.00,  34.94}, {224.00,  31.47}, {240.00,  30.37}, {247.00,  32.51}, {249.77,  35.00}, {234.75,  53.00}, {213.81,  93.00}, {212.08,  99.00}, {213.00, 101.77}, {220.00,  96.77}, {229.00,  96.48}, {236.28, 101.00},
	{240.00, 107.96}, {245.08, 101.00}, {263.00,  65.32}, {277.47,  48.00}, {284.00,  47.03}, {286.94,  41.00}, {292.00,  36.62}, {298.00,  35.06}, {304.00,  35.77}, {314.00,  43.81}, {342.00,  32.56}, {359.00,  31.32},
	{365.00,  32.57}, {371.00,  36.38}, {379.53,  48.00}, {379.70,  51.00}, {356.00,  52.19}, {347.00,  54.74}, {344.38,  66.00}, {341.00,  70.27}, {335.00,  73.52}, {324.00,  72.38}, {317.00,  65.75}, {313.00,  67.79},
	{307.57,  76.00}, {315.00,  78.62}, {319.28,  82.00}, {322.23,  87.00}, {323.00,  94.41}, {334.00,  92.49}, {347.00,  87.47}, {349.62,  80.00}, {353.00,  75.73}, {359.00,  72.48}, {366.00,  72.32}, {372.00,  74.94},
	{377.00,  81.34}, {382.00,  83.41}, {392.00,  83.40}, {399.00,  79.15}, {404.00,  85.74}, {411.00,  85.06}, {417.00,  86.62}, {423.38,  93.00}, {425.05, 104.00}, {438.00, 110.35}, {450.00, 112.17}, {452.62, 103.00},
	{456.00,  98.73}, {462.00,  95.48}, {472.00,  95.79}, {471.28,  92.00}, {464.00,  84.62}, {445.00,  80.39}, {436.00,  75.33}, {428.00,  68.46}, {419.00,  68.52}, {413.00,  65.27}, {408.48,  58.00}, {409.87,  46.00},
	{404.42,  39.00}, {408.00,  33.88}, {415.00,  29.31}, {429.00,  26.45}, {455.00,  28.77}, {470.00,  33.81}, {482.00,  42.16}, {494.00,  46.85}, {499.65,  36.00}, {513.00,  25.95}, {529.00,  22.42}, {537.18,  23.00}, 
};
static int bouncy_terrain_count = sizeof(bouncy_terrain_verts)/sizeof(cpVect);

-(void)setup
{
	cpVect offset = cpv(-320, -240);
	for(int i=0; i<(bouncy_terrain_count - 1); i++){
		cpVect a = bouncy_terrain_verts[i], b = bouncy_terrain_verts[i+1];
		ChipmunkShape *shape = [self.space add:[ChipmunkSegmentShape segmentWithBody:self.staticBody from:cpvadd(a, offset) to:cpvadd(b, offset) radius:1.0]];
		shape.elasticity = 1.0f;
		shape.layers = NOT_GRABABLE_MASK;
	}
	
	cpFloat radius = 5.0f;
	cpVect hexagon[6] = {};
	for(int i=0; i<6; i++){
		cpFloat angle = -M_PI*2.0f*i/6.0f;
		hexagon[i] = cpvmult(cpv(cos(angle), sin(angle)), radius);
	}
	
	NSUInteger count = [self numberForA4:400 A5:550];
	
	for(int i=0; i<count; i++){
		cpFloat mass = radius*radius;
		ChipmunkBody *body = [self.space add:[ChipmunkBody bodyWithMass:mass andMoment:cpMomentForPoly(mass, 6, hexagon, cpvzero)]];
		body.pos = cpvadd(cpvmult(frand_unit_circle(), 140.0f), cpvzero);
		body.vel = cpvmult(frand_unit_circle(), 50.0f);
		
		ChipmunkShape *shape = [self.space add:[ChipmunkPolyShape polyWithBody:body count:6 verts:hexagon offset:cpvzero]];
		shape.elasticity = 1.0f;
	}
}

@end
