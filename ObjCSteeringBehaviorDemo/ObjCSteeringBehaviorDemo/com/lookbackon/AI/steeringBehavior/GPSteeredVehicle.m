//
//  GPSteeredVehicle.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPSteeredVehicle.h"

@implementation GPSteeredVehicle
//
@synthesize arriveThreshold,avoidDistance,avoidBuffer,pathThreshold,pathIndex;
//value initilaziation
- (instancetype)initWithImageNamed:(NSString *)name
{
    steeringForce = [[Vector2D alloc] initWithX:0 Y:0];
    return [self initWithImageNamed:name];
}
#pragma mark -protocols
-(void)seek:(Vector2D*)target
{
    
}
-(void)flee:(Vector2D*)target
{
    
}
-(void)arrive:(Vector2D*)target
{
    
}
-(void)pursue:(Vector2D*)target
{
    
}
-(void)evade:(Vector2D*)target
{
    
}
-(void)wander
{
    
}
-(void)avoid:(NSArray*)circles
{
}
-(void)followPath:(NSArray*)path loop:(BOOL)loop
{
    
}
-(void)flock:(NSArray*)circles
{
    
}
-(BOOL)inSight:(GPVehicle *)vehicle
{
    return NO;
}
-(BOOL)tooClose:(GPVehicle *)vehicle
{
    return NO;
}
@end
