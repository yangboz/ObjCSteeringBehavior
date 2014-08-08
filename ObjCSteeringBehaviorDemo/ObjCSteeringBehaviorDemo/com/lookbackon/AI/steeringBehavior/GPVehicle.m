//
//  GPVehicle.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//
/**
 * Base class for moving characters.
 */
#import "GPVehicle.h"

@implementation GPVehicle
//@protected
NSString *_edgeBehavior  = @"WRAP";
NSNumber* _mass;// = 1.0;
NSNumber* _maxSpeed;// = 10;
Vector2D * _positionV2D;
Vector2D * _velocityV2D;
// potential edge behaviors
static const NSString *WRAP = @"wrap";
static const NSString *BOUNCE = @"bounce";
//
@synthesize mass,maxSpeed,velocityV2D,positionV2D;
//value initilaziation
- (instancetype)initWithImageNamed:(NSString *)name
{
    _positionV2D = [[Vector2D alloc] initWithX:0 Y:0];
    _velocityV2D = [[Vector2D alloc] initWithX:0 Y:0];
    [self draw];
    return [self initWithImageNamed:name];
}
/**
 * Default graphics for vehicle. Can be overridden in subclasses.
 */
-(void)draw
{
//    graphics.clear();
//    graphics.lineStyle(0);
//    graphics.moveTo(10, 0);
//    graphics.lineTo(-10, 5);
//    graphics.lineTo(-10, -5);
//    graphics.lineTo(10, 0);
}
/**
 * Handles all basic motion. Should be called on each frame / timer interval.
 */
-(void)update
{
    // make sure velocity stays within max speed.
    [_velocityV2D truncateV2D:[_maxSpeed floatValue]];
    // add velocity to position
    _positionV2D = [_positionV2D add:_velocityV2D];
    // handle any edge behavior
    if(_edgeBehavior == WRAP)
    {
        [self wrap];
    }
    else if(_edgeBehavior == BOUNCE)
    {
        [self bounce];
    }
    
    // update position of sprite
    x = _positionV2D->x;
    y = _positionV2D->y;
    
    // rotate heading to match velocity
    rotation = [_velocityV2D angle] * 180 / M_PI;
}

/**
 * Causes character to bounce off edge if edge is hit.
 */
-(void)bounce
{
    if(YES)
    {
        if(_positionV2D->x > self.size.width)
        {
            _positionV2D->x = self.size.width;
            _velocityV2D->x *= -1;
        }
        else if(_positionV2D->x < 0)
        {
            _positionV2D->x = 0;
            _velocityV2D->x *= -1;
        }
        
        if(_velocityV2D->y > self.size.height)
        {
            _positionV2D->y = self.size.height;
            _velocityV2D->y *= -1;
        }
        else if(_velocityV2D->y < 0)
        {
            _positionV2D->y = 0;
            _velocityV2D->y *= -1;
        }
    }
}

/**
 * Causes character to wrap around to opposite edge if edge is hit.
 */
-(void)wrap
{
    if(YES)//stage != NULL
    {
        if(_positionV2D->x > self.size.width) _positionV2D->x = 0;
        if(_positionV2D->x < 0) _positionV2D->x = self.size.width;
        if(_positionV2D->y > self.size.height) _positionV2D->y = 0;
        if(_positionV2D->y < 0) _positionV2D->y = self.size.height;
    }
}

/**
 * Sets / gets what will happen if character hits edge.
 */
-(void)setEdgeBehavior:(NSString *)value
{
    _edgeBehavior = value;
}
-(NSString *)getEdgeBehavior
{
    return _edgeBehavior;
}

/**
 * Sets / gets mass of character.
 */
-(void)setMass:(NSNumber*)value
{
    _mass = value;
}
-(NSNumber*)getMass
{
    return _mass;
}

/**
 * Sets / gets maximum speed of character.
 */
-(void)setMaxSpeed:(NSNumber*)value
{
    _maxSpeed = value;
}
-(NSNumber*)getMaxSpeed
{
    return _maxSpeed;
}

/**
 * Sets / gets position of character as a Vector2D.
 */
-(void)setPositionV2D:(Vector2D *)value
{
    _positionV2D = value;
    x = _positionV2D->x;
    y = _positionV2D->y;
}
-(Vector2D *)getPosition
{
    return _positionV2D;
}

/**
 * Sets / gets velocity of character as a Vector2D.
 */
-(void)setVelocity:(Vector2D *)value
{
    _velocityV2D = value;
}
-(Vector2D *)getVelocity
{
    return _velocityV2D;
}

/**
 * Sets x position of character. Overrides Sprite.x to set internal Vector2D position as well.
 */
-(void)setX:(float)value
{
    x = value;
    _positionV2D->x = x;
}

/**
 * Sets y position of character. Overrides Sprite.y to set internal Vector2D position as well.
 */
-(void)setY:(float)value
{
    y = value;
    _positionV2D->y = y;
}
@end
