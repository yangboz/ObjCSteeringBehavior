//
//  Vector2D.m
//  Boids
//
//  Created by David Nolen on 11/3/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "Vector2D.h"
#import <stdlib.h>
#import <math.h>

BOOL isZero(float a)
{
    return (fabs(a) < kEpsilon);
}

BOOL areEqual(float a, float b)
{
    return isZero(a-b);
}

@implementation Vector2D

#pragma mark -
#pragma mark new

+ (Vector2D*) withX:(float)x Y:(float)y
{
    return [[[Vector2D alloc] initWithX:x Y:y] autorelease];
}

+ (Vector2D*) newWithX:(float)x Y:(float)y
{
    return [[Vector2D alloc] initWithX:x Y:y];
}

#pragma mark -
#pragma mark Non-mutating Class methods

+ (Vector2D*) add:(Vector2D*)v1 to:(Vector2D*)v2
{
    return [[[v1 copy] add:v2] autorelease];
}

+ (Vector2D*) sub:(Vector2D*)v1 with:(Vector2D*)v2
{
    return [[[v1 copy] sub:v2] autorelease];
}

+ (Vector2D*) mult:(Vector2D*)v with:(float)scalar
{
    return [[[v copy] mult:scalar] autorelease];
}

+ (Vector2D*) div:(Vector2D*)v with:(float)scalar
{
    return [[[v copy] div:scalar] autorelease];
}

+ (float) dot:(Vector2D*)v1 with:(Vector2D*)v2
{
    return [v1 dot:v2];
}

+ (Vector2D*) zero
{
    return [Vector2D withX:0.0f Y:0.0f];
}

+ (Vector2D*) randomInside:(CGRect)rect
{
    return [Vector2D withX:(rect.origin.x + (arc4random() % (int)rect.size.width)) Y:(rect.origin.y + (arc4random() % (int)rect.size.height))];
}

#pragma mark -
#pragma mark Useful Constants

static Vector2D* xAxis = nil;
static Vector2D* yAxis = nil;
static Vector2D* origin = nil;
static Vector2D* xy = nil;

+ (Vector2D*) xAxis
{
    if(nil == xAxis)
    {
        xAxis = [Vector2D newWithX:1.0f Y:0.0f];
    }
    return xAxis;
}

+ (Vector2D*) yAxis
{
    if(nil == yAxis)
    {
        yAxis = [Vector2D newWithX:0.0f Y:1.0f];
    }
    return yAxis;
}

+ (Vector2D*) origin
{
    if(nil == origin)
    {
        origin = [Vector2D newWithX:0.0f Y:0.0f];
    }
    return origin;
}

+ (Vector2D*) xy
{
    if(nil == xy)
    {
        xy = [Vector2D newWithX:1.0f Y:1.0f];
    }
    return xy;
}

#pragma mark -
#pragma mark Instance Methods

- (Vector2D*) init
{
    self = [self initWithX:0.0f Y:0.0f];
    return self;
}

- (Vector2D*) initWithX:(float)nx Y:(float)ny
{
    self = [super init];
    if(nil != self)
    {
        x = nx;
        y = ny;
    }
    return self;
}

- (Vector2D*) copyWithZone:(NSZone *)zone
{
    return [[Vector2D alloc] initWithX:x Y:y];
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%f, %f>", x, y];
}
- (void) setLength:(float)value
{
    float a = self.angle;
    x = cos(a) * value;
    y = sin(a) * value;
}
- (float) length
{
    return sqrt(self.lengthSquared);
}

- (float) lengthSquared
{
    return (x*x + y*y);
}

- (BOOL) isEqual:(Vector2D*)other
{
    if (areEqual(x, other->x) && areEqual(y, other->y))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL) isZero
{
    return isZero(x*x + y*y);
}

- (Vector2D*) clean
{
    if(isZero(x)) x = 0.0f;
    if(isZero(y)) y = 0.0f;
    return self;
}

- (Vector2D*) zero
{
    x = 0.0f;
    y = 0.0f;
    return self;
}

- (Vector2D*) normalize
{
    float lengthsq = x*x + y*y;
    if (isZero(lengthsq))
    {
        x = 0.0f;
        y = 0.0f;
    }
    else
    {
        float factor = 1.0f / sqrt(lengthsq);
        x *= factor;
        y *= factor;
    }
    return self;
}

- (Vector2D*) limit:(float)limit
{
    return [[self normalize] mult:limit];
}

- (Vector2D*) add:(Vector2D*)other
{
    x += other->x;
    y += other->y;
    return self;
}

- (Vector2D*) sub:(Vector2D*)other
{
    x -= other->x;
    y -= other->y;
    return self;
}

- (Vector2D*) mult:(float)scalar
{
    x *= scalar;
    y *= scalar;
    return self;
}

- (Vector2D*) div:(float)scalar
{
    x /= scalar;
    y /= scalar;
    return self;
}

- (float) dot:(Vector2D*)other
{
    return (x*other->x + y*other->y);
}

- (Vector2D*) perp
{
    return [Vector2D newWithX:-y Y:x];
}

- (float) perpDot:(Vector2D*)other
{
    return (x*other->y - y*other->x);
}

/**
 * Gets / sets the angle of this vector. Changing the angle changes the x and y but retains the same length.
 */
-(void)setAngle:(float)value
{
    float len = self.length;
    x = cos(value) * len;
    y = sin(value) * len;
}
-(float)angle
{
    return atan2(y, x);
}
/**
 * Ensures the length of the vector is no longer than the given value.
 * @param max The maximum value this vector should be. If length is larger than max, it will be truncated to this value.
 * @return Vector2D A reference to this vector.
 */
-(Vector2D *)truncateV2D:(float)max
{
    self.length = fmin(max, self.length);
    return self;
}

/**
 * Calculates the distance from this vector to another given vector.
 * @param other A Vector2D instance.
 * @return Number The distance from this vector to the vector passed as a parameter.
 */
-(float)dist:(Vector2D *)other
{
    return sqrt([self distSQ:other]);
}

/**
 * Calculates the distance squared from this vector to another given vector.
 * @param other A Vector2D instance.
 * @return Number The distance squared from this vector to the vector passed as a parameter.
 */
-(float)distSQ:(Vector2D *)other
{
    float dx = other->x - x;
    float dy = other->y - y;
    return dx * dx + dy * dy;
}
/**
 * Determines if a given vector is to the right or left of this vector.
 * @return int If to the left, returns -1. If to the right, +1.
 */
-(int)sign:(Vector2D*)other
{
    return [self.perp dot:other ] < 0 ? -1 :1;
}
@end
