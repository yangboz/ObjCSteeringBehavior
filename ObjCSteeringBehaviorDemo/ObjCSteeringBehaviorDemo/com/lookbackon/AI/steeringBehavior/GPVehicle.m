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
//NSString *_edgeBehavior  = @"wrap";
//NSNumber* _mass;// = 1.0;
//NSNumber* _maxSpeed;// = 10;
//Vector2D * _positionV2D;
//Vector2D * _velocityV2D;
//
@synthesize mass,maxSpeed,velocityV2D,positionV2D,edgeBehavior,x,y,winWidth,winHeight;
//value initilaziation
- (void)initVariables
{
    positionV2D = [[Vector2D alloc] initWithX:0 Y:0];
    velocityV2D = [[Vector2D alloc] initWithX:0 Y:0];
    [self draw];
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
    [velocityV2D truncateV2D:[maxSpeed floatValue]];
    // add velocity to position
    positionV2D = [positionV2D add:velocityV2D];
    // handle any edge behavior
    if([edgeBehavior isEqual:@"wrap"])
    {
        [self wrap];
    }
    else if([edgeBehavior isEqual:@"bounce"] )
    {
        [self bounce];
    }
    
    // update position of sprite
    x = [[NSNumber alloc] initWithFloat: positionV2D->x];
    y = [[NSNumber alloc] initWithFloat:positionV2D->y];
    
    // rotate heading to match velocity
    rotation = [velocityV2D angle] * 180 / M_PI;
    // Manully move SKSpriteNode;
    self.position = CGPointMake([x floatValue], [y floatValue]);
    NSLog(@"Updated position:<%f,%f>,velocity:%@,positionV2D:%@",self.position.x,self.position.y,velocityV2D,positionV2D);
}

/**
 * Causes character to bounce off edge if edge is hit.
 */
-(void)bounce
{
        if(positionV2D->x > [self.winWidth floatValue])
        {
            positionV2D->x = [self.winWidth floatValue];
            velocityV2D->x *= -1;
        }
        else if(positionV2D->x < 0)
        {
            positionV2D->x = 0;
            velocityV2D->x *= -1;
        }
        
        if(positionV2D->y > [self.winHeight floatValue])
        {
            positionV2D->y = [self.winHeight floatValue];
            velocityV2D->y *= -1;
        }
        else if(positionV2D->y < 0)
        {
            positionV2D->y = 0;
            velocityV2D->y *= -1;
        }
}

/**
 * Causes character to wrap around to opposite edge if edge is hit.
 */
-(void)wrap
{
    if(YES)//stage != NULL
    {
        if(positionV2D->x > [self.winWidth floatValue]) positionV2D->x = 0;
        if(positionV2D->x < 0) positionV2D->x =  [self.winWidth floatValue];
        if(positionV2D->y >  [self.winHeight floatValue]) positionV2D->y = 0;
        if(positionV2D->y < 0) positionV2D->y =  [self.winHeight floatValue];
    }
}

/**
 * Sets / gets what will happen if character hits edge.
 */
-(void)setEdgeBehavior:(NSString *)value
{
    edgeBehavior = value;
}
-(NSString *)getEdgeBehavior
{
    return edgeBehavior;
}

/**
 * Sets / gets mass of character.
 */
-(void)setMass:(NSNumber*)value
{
    mass = value;
}
-(NSNumber*)getMass
{
    return mass;
}

/**
 * Sets / gets maximum speed of character.
 */
-(void)setMaxSpeed:(NSNumber*)value
{
    maxSpeed = value;
}
-(NSNumber*)getMaxSpeed
{
    return maxSpeed;
}

/**
 * Sets / gets position of character as a Vector2D.
 */
-(void)setPositionV2D:(Vector2D *)value
{
    positionV2D = value;
    x = [[NSNumber alloc] initWithFloat:positionV2D->x];
    y = [[NSNumber alloc] initWithFloat:positionV2D->y];
}
-(Vector2D *)getPositionV2D
{
    return positionV2D;
}

/**
 * Sets / gets velocity of character as a Vector2D.
 */
-(void)setVelocity:(Vector2D *)value
{
    velocityV2D = value;
}
-(Vector2D *)getVelocity
{
    return velocityV2D;
}

/**
 * Sets x position of character. Overrides Sprite.x to set internal Vector2D position as well.
 */
-(void)setX:(NSNumber *)value
{
    x = value;
    positionV2D->x = [x floatValue];
}
-(NSNumber *)getX
{
    return x;
}
/**
 * Sets y position of character. Overrides Sprite.y to set internal Vector2D position as well.
 */
-(void)setY:(NSNumber *)value
{
    y = value;
    positionV2D->y = [y floatValue];
}
-(NSNumber *)getY
{
    return y;
}
@end
