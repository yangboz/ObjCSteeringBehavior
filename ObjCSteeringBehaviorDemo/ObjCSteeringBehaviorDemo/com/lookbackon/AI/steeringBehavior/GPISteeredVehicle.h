//
//  GPISteeredVehicle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GPIVehicle.h"
#import "GPIArrive.h"
#import "GPIAvoid.h"
#import "GPIEvade.h"
#import "GPIFlee.h"
#import "GPIFollowPath.h"
#import "GPIFlock.h"
#import "GPIFollowPath.h"
#import "GPIPursue.h"
#import "GPISeek.h"
#import "GPIWander.h"

@protocol GPISteeredVehicle <GPIArrive,GPIAvoid,GPIEvade,GPIFlee,GPIFollowPath,GPIFlock,GPIFlock,GPIPursue,GPISeek,GPIWander>

@required
-(BOOL)inSight:(GPVehicle *)vehicle;
-(BOOL)tooClose:(GPVehicle *)vehicle;


@end
