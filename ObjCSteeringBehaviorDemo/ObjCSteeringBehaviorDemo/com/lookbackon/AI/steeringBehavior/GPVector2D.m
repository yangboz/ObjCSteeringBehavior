//
//  GPVector2D.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPVector2D.h"
/**
 * A basic 2-dimensional vector class.
 */
@implementation GPVector2D

float _x;
float _y;

//Constructor.
-(GPVector2D*) initWithX:(float)x Y:(float)y
{
    self = [super init];
    if(nil != self)
    {
        _x = x;
        _y = y;
    }
    return self;
}
//  Can be used to visualize the vector. Generally used for debug purposes only.
//  @param graphics The Graphics instance to draw the vector on.
//  @param color The color of the line used to represent the vector.
/*
-(void)draw(graphics:Graphics, color:uint = 0):void
{
    graphics.lineStyle(0, color);
    graphics.moveTo(0, 0);
    graphics.lineTo(_x, _y);
}
*/

//Generates a copy of this vector.
//@return Vector2D A copy of this vector.
-(GPVector2D*)clone
{
    return [[GPVector2D alloc] initWithX:_x Y:_y];
}

/**
 * Sets this vector's x and y values, and thus length, to zero.
 * @return Vector2D A reference to this vector.
 */
-(GPVector2D*)zero
{
    _x = 0;
    _y = 0;
    return self;
}

/**
 * Whether or not this vector is equal to zero, i.e. its x, y, and length are zero.
 * @return Boolean True if vector is zero, otherwise false.
 */
-(BOOL)isZero
{
    return _x == 0 && _y == 0;
}

/**
 * Sets / gets the length or magnitude of this vector. Changing the length will change the x and y but not the angle of this vector.
 */
-(void)setLength:(float)value
{
    float a = angle;
    _x = cos(a) * value;
    _y = sin(a) * value;
}
-(float)getLength
{
    return sqrt(lengthSQ);
}

/**
 * Gets the length of this vector, squared.
 */
-(float)getLengthSQ
{
    return _x * _x + _y * _y;
}

/**
 * Gets / sets the angle of this vector. Changing the angle changes the x and y but retains the same length.
 */
-(void)setAngle:(float)value
{
    float len = length;
    _x = cos(value) * len;
    _y = sin(value) * len;
}
-(float)getAngle
{
    return atan2(_y, _x);
}

/**
 * Normalizes this vector. Equivalent to setting the length to one, but more efficient.
 * @return Vector2D A reference to this vector.
 */
-(GPVector2D*)normalize
{
    if(length == 0)
    {
        _x = 1;
        return self;
    }
    float len = length;
    _x /= len;
    _y /= len;
    return self;
}

/**
 * Ensures the length of the vector is no longer than the given value.
 * @param max The maximum value this vector should be. If length is larger than max, it will be truncated to this value.
 * @return Vector2D A reference to this vector.
 */
-(GPVector2D *)truncate:(float)max
{
    length = fmin(max, length);
    return self;
}

/**
 * Reverses the direction of this vector.
 * @return Vector2D A reference to this vector.
 */
-(GPVector2D *)reverse
{
    _x = -_x;
    _y = -_y;
    return self;
}

/**
 * Whether or not this vector is normalized, i.e. its length is equal to one.
 * @return Boolean True if length is one, otherwise false.
 */
-(BOOL)isNormalized
{
    return length == 1.0;
}

/**
 * Calculates the dot product of this vector and another given vector.
 * @param v2 Another Vector2D instance.
 * @return Number The dot product of this vector and the one passed in as a parameter.
 */
-(float)dotProd:(GPVector2D *)v2
{
    return _x * v2.x + _y * v2.y;
}

/**
 * Calculates the cross product of this vector and another given vector.
 * @param v2 Another Vector2D instance.
 * @return Number The cross product of this vector and the one passed in as a parameter.
 */
-(float)crossProd:(GPVector2D *)v2
{
    return _x * v2.y - _y * v2.x;
}

/**
 * Calculates the angle between two vectors.
 * @param v1 The first Vector2D instance.
 * @param v2 The second Vector2D instance.
 * @return Number the angle between the two given vectors.
 */
+(float)angleBetween:(GPVector2D *)v1 v2:(GPVector2D *)v2;
{
    if(!v1.isNormalized()) v1 = v1.clone().normalize();
    if(!v2.isNormalized()) v2 = v2.clone().normalize();
    return Math.acos(v1.dotProd(v2));
}

/**
 * Determines if a given vector is to the right or left of this vector.
 * @return int If to the left, returns -1. If to the right, +1.
 */
-(int)sign:(GPVector2D *)v2
{
    return perp.dotProd(v2) < 0 ? -1 : 1;
}

/**
 * Finds a vector that is perpendicular to this vector.
 * @return Vector2D A vector that is perpendicular to this vector.
 */
-(GPVector2D*)getPerp
{
    return new Vector2D(-y, x);
}

/**
 * Calculates the distance from this vector to another given vector.
 * @param v2 A Vector2D instance.
 * @return Number The distance from this vector to the vector passed as a parameter.
 */
-(float)dist:(GPVector2D*)v2
{
    return Math.sqrt(distSQ(v2));
}

/**
 * Calculates the distance squared from this vector to another given vector.
 * @param v2 A Vector2D instance.
 * @return Number The distance squared from this vector to the vector passed as a parameter.
 */
-(float)distSQ:(GPVector2D*)v2
{
    var dx:Number = v2.x - x;
    var dy:Number = v2.y - y;
    return dx * dx + dy * dy;
}

/**
 * Adds a vector to this vector, creating a new Vector2D instance to hold the result.
 * @param v2 A Vector2D instance.
 * @return Vector2D A new vector containing the results of the addition.
 */
-(GPVector2D *)add:(GPVector2D *)v2
{
    return new GPVector2D(_x + v2.x, _y + v2.y);
}

/**
 * Subtacts a vector to this vector, creating a new Vector2D instance to hold the result.
 * @param v2 A Vector2D instance.
 * @return Vector2D A new vector containing the results of the subtraction.
 */
-(GPVector2D *)subtract:(GPVector2D *)v2
{
    return new GPVector2D(_x - v2.x, _y - v2.y);
}

/**
 * Multiplies this vector by a value, creating a new Vector2D instance to hold the result.
 * @param v2 A Vector2D instance.
 * @return Vector2D A new vector containing the results of the multiplication.
 */
-(GPVector2D *)multiply:(float)value
{
    return new GPVector2D(_x * value, _y * value);
}

/**
 * Divides this vector by a value, creating a new Vector2D instance to hold the result.
 * @param v2 A Vector2D instance.
 * @return Vector2D A new vector containing the results of the division.
 */
-(GPVector2D *)divide:(float)value
{
    return new GPVector2D(_x / value, _y / value);
}

/**
 * Indicates whether this vector and another Vector2D instance are equal in value.
 * @param v2 A Vector2D instance.
 * @return Boolean True if the other vector is equal to this one, false if not.
 */
-(BOOL)equals:(GPVector2D *)v2
{
    return _x == v2.x && _y == v2.y;
}

/**
 * Sets / gets the x value of this vector.
 */
-(void)setX:(float)value
{
    _x = value;
}
-(float)getX
{
    return _x;
}

/**
 * Sets / gets the y value of this vector.
 */
-(void)setY:(float)value
{
    _y = value;
}
-(float)getY
{
    return _y;
}

/**
 * Generates a string representation of this vector.
 * @return String A description of this vector.
 */
-(NSString *)toString
{
    return @"[Vector2D (x:" + _x + @", y:" + _y + @")]";
}
@end
