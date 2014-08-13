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
@synthesize arrivalThreshold,avoidDistance,avoidBuffer,pathThreshold,pathIndex;
//value initilaziation
- (void)initVariables
{
    steeringForce = [[Vector2D alloc] initWithX:0 Y:0];
    self.positionV2D = [[Vector2D alloc] initWithX:0 Y:0];
    self.velocityV2D = [[Vector2D alloc] initWithX:0 Y:0];
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
    self.mass = [[NSNumber alloc] initWithFloat:1.0];
    self.maxSpeed  = [[NSNumber alloc] initWithFloat:10.0];
    self.edgeBehavior = BOUNCE;
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
    Vector2D *desiredVelocity = [Vector2D sub:target with:self.positionV2D];
    [desiredVelocity normalize];
    //
    float dist = [self.positionV2D dist:target];
    
    if(dist > [arrivalThreshold floatValue])
    {
        desiredVelocity = [desiredVelocity mult:[self.maxSpeed floatValue]];
    }
    else
    {
        desiredVelocity = [desiredVelocity mult:[self.maxSpeed floatValue] * dist/[arrivalThreshold floatValue]];
    }
    Vector2D *force = [desiredVelocity sub:self.velocityV2D];
    steeringForce = [steeringForce add:force];
    //
    NSLog(@"SteeredVehicle arrive:%@,force:%@,dist:%f,desiredVelocity:%@",target,steeringForce,dist,desiredVelocity);
}
-(void)pursue:(Vector2D*)target
{
    
}
-(void)evade:(Vector2D*)target
{
    
}
-(void)wander
{
    Vector2D *center = [[[self.velocityV2D copy] normalize]mult:[wanderDistance floatValue]];
    Vector2D *offset = [[Vector2D alloc] initWithX:0 Y:0];
    offset.length = [wanderRadius floatValue];
    offset.angle = [wanderAngle floatValue];
    wanderRange= [[NSNumber alloc] initWithFloat:( arc4random_uniform(1) * [wanderRange floatValue] - [wanderRange floatValue] * .5)];
    Vector2D *force = [center add:offset];
    self->steeringForce = [self->steeringForce add:force];
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
    self->steeringForce = [self->steeringForce div:[self.mass floatValue]];
    self.velocityV2D = [self.velocityV2D add:steeringForce];
//    NSLog(@"mass:%f,force:%@,velocityV2D:%@",[self.mass floatValue],self->steeringForce,self.velocityV2D);
    //Reset
    steeringForce = [[Vector2D alloc] initWithX:0.0 Y:0.0];
    [super update];
}
@end
