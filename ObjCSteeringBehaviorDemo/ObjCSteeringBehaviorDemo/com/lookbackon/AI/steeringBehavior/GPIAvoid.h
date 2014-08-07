//
//  GPIAvoid.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIAvoid <NSObject>
@required
@property(retain,nonatomic) NSNumber *avoidDistance;
@property(retain,nonatomic) NSNumber *avoidBuffer;
-(void)avoid:(NSArray*)circles;
@end
