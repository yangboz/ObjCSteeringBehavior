//
//  GPIEvade.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIEvade <NSObject>
@required
-(void)evade:(GPVehicle*)target;
@end
