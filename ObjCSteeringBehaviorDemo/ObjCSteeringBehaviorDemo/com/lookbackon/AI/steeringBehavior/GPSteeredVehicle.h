//
//  GPSteeredVehicle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPVehicle.h"
#import "GPISteeredVehicle.h"

@interface GPSteeredVehicle : GPVehicle <GPISteeredVehicle>
{
    NSNumber * maxForce;
    Vector2D * steeringForce;
    NSNumber * arrivalThreshold;
    NSNumber * wanderAngle;
    NSNumber * wanderDistance;
    NSNumber * wanderRadius;
    NSNumber * wanderRange;
    NSNumber * pathIndex;
    NSNumber * pathThreshold;
    NSNumber * avoidDistance;
    NSNumber * avoidBuffer;
    NSNumber * inSightDist;
    NSNumber * tooCloseDist;
}
@end
