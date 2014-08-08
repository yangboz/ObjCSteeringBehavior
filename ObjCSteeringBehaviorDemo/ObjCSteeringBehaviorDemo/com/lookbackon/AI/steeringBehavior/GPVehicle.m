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
@end
