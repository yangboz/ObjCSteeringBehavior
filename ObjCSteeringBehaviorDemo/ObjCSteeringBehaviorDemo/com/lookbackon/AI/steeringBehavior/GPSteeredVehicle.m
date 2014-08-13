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
@synthesize mass,maxSpeed,velocityV2D,positionV2D,edgeBehavior;
@synthesize arrivalThreshold,avoidDistance,avoidBuffer,pathThreshold,pathIndex;
//value initilaziation
- (void)initVariables
{
    steeringForce = [[Vector2D alloc] initWithX:0 Y:0];
    positionV2D = [[Vector2D alloc] initWithX:0 Y:0];
    velocityV2D = [[Vector2D alloc] initWithX:0 Y:0];
    //
    maxForce = [[NSNumber alloc] initWithFloat:1.0];
//
    arrivalThreshold = [[NSNumber alloc] initWithFloat:100.0];
    wanderAngle = [[NSNumber alloc] initWithFloat:0.0];
    wanderDistance = [[NSNumber alloc] initWithFloat:10.0];
    wanderRadius = [[NSNumber alloc] initWithFloat:5.0];
    wanderRange = [[NSNumber alloc] initWithFloat:1.0];
    pathIndex = [[NSNumber alloc] initWithFloat:1.0];
    pathThreshold = [[NSNumber alloc] initWithFloat:20.0];
    avoidDistance = [[NSNumber alloc] initWithFloat:300.0];
    avoidBuffer = [[NSNumber alloc] initWithFloat:20.0];
    inSightDist = [[NSNumber alloc] initWithFloat:200.0];
    tooCloseDist = [[NSNumber alloc] initWithFloat:60.0];
    //
    mass = [[NSNumber alloc] initWithFloat:1.0];
    maxSpeed  = [[NSNumber alloc] initWithFloat:10.0];
    edgeBehavior = [[NSString alloc] initWithString:@"wrap"];
    //
    [super initVariables];
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
    //
    Vector2D *desiredVelocity = [target sub:positionV2D];
    [desiredVelocity normalize];
    
    float dist = [positionV2D dist:target];
    if(dist > [arrivalThreshold floatValue])
    {
        desiredVelocity = [desiredVelocity mult:[maxSpeed floatValue]];
    }
    else
    {
        desiredVelocity = [desiredVelocity mult:[maxSpeed floatValue] * dist/[arrivalThreshold floatValue]];
    }
    
    Vector2D *force = [desiredVelocity sub:velocityV2D];
    steeringForce = [steeringForce add:force];
    NSLog(@"SteeredVehicle arrive:(%f,%f)",target->x,target->y);
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
-(void)update
{
    [steeringForce truncateV2D:[maxForce floatValue]];
    steeringForce = [steeringForce div:[mass floatValue]];
    velocityV2D = [velocityV2D add:steeringForce];
    steeringForce = [[Vector2D alloc] initWithX:0.0 Y:0.0];
    [super update];
}
@end
