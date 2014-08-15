//
//  GPIFollowPath.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIFollowPath <NSObject>
@required
@property(retain,nonatomic) NSNumber *pathIndex;
@property(retain,nonatomic) NSNumber *pathThreshold;
-(void)followPath:(NSArray*)path loop:(BOOL)loop;
@end
