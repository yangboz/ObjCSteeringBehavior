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
float _mass = 1.0;
float _maxSpeed;// = 10;
Vector2D * _positionV2D;
Vector2D * _velocityV2D;
// potential edge behaviors
static const NSString *WRAP;// = @"wrap";
static const NSString *BOUNCE;// = @"bounce";
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
    _velocityV2D.truncate(_maxSpeed);
    
    // add velocity to position
    _positionV2D = _positionV2D.add(_velocityV2D);
    
    // handle any edge behavior
    if(_edgeBehavior == WRAP)
    {
        wrap();
    }
    else if(_edgeBehavior == BOUNCE)
    {
        bounce();
    }
    
    // update position of sprite
    x = _positionV2D->x;
    y = _positionV2D->y;
    
    // rotate heading to match velocity
    rotation = _velocityV2D->angle * 180 / Math.PI;
}

/**
 * Causes character to bounce off edge if edge is hit.
 */
-(void)bounce
{
    if(stage != NULL)
    {
        if(_positionV2D.x > stage.stageWidth)
        {
            position.x = stage.stageWidth;
            velocity.x *= -1;
        }
        else if(position.x < 0)
        {
            position.x = 0;
            velocity.x *= -1;
        }
        
        if(position.y > stage.stageHeight)
        {
            position.y = stage.stageHeight;
            velocity.y *= -1;
        }
        else if(position.y < 0)
        {
            position.y = 0;
            velocity.y *= -1;
        }
    }
}

/**
 * Causes character to wrap around to opposite edge if edge is hit.
 */
-(void)wrap
{
    if(stage != null)
    {
        if(position.x > stage.stageWidth) position.x = 0;
        if(position.x < 0) position.x = stage.stageWidth;
        if(position.y > stage.stageHeight) position.y = 0;
        if(position.y < 0) position.y = stage.stageHeight;
    }
}

/**
 * Sets / gets what will happen if character hits edge.
 */
-(void)setEdgeBehavior:(NSString *)value
{
    _edgeBehavior = value;
}
-(NSString )getEdgeBehavior
{
    return _edgeBehavior;
}

/**
 * Sets / gets mass of character.
 */
-(void)setMass:(NSNumber *)value
{
    _mass = value;
}
-(NSNumber *)getMass
{
    return _mass;
}

/**
 * Sets / gets maximum speed of character.
 */
-(void)setMaxSpeed:(NSNumber *)valuevoid
{
    _maxSpeed = value;
}
-(NSNumber *)getMaxSpeed
{
    return _maxSpeed;
}

/**
 * Sets / gets position of character as a Vector2D.
 */
-(void)setPositionV2D:(Vector2D *)value
{
    _position = value;
    x = _position.x;
    y = _position.y;
}
-(Vector2D *)getPosition
{
    return _position;
}

/**
 * Sets / gets velocity of character as a Vector2D.
 */
-(void)setVelocity:(Vector2D *)value
{
    _velocity = value;
}
-(Vector2D *)getVelocity
{
    return _velocity;
}

/**
 * Sets x position of character. Overrides Sprite.x to set internal Vector2D position as well.
 */
-(void)setX:(NSNumber *)value
{
    super.x = value;
    _position.x = x;
}

/**
 * Sets y position of character. Overrides Sprite.y to set internal Vector2D position as well.
 */
-(void)setY:(NSNumber *)value
{
    super.y = value;
    _position.y = y;
}
@end
