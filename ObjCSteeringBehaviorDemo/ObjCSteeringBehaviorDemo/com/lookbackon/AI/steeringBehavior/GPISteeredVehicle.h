//
//  GPISteeredVehicle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPISteeredVehicle <NSObject,GPIVehicle,GPIArrive,GPIAvoid,GPIEvade,GPIFlee,GPIFllowPath,GPIFlock,GPIFlock,GPIPursue,GPISeek,GPIWander>
@required
@property(retain,nonatomic) NSNumber *maxForce;
@property(retain,nonatomic) NSNumber *inSightDist;
@property(retain,nonatomic) NSNumber *tooCloseDist;
-(BOOL)inSight:(GPVehicle *);
-(BOOL)tooClose:(GPVehicle *);
@end
