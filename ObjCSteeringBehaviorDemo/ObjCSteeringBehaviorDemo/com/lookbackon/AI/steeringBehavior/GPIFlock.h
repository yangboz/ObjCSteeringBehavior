//
//  GPIFlock.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIFlock <NSObject>
@required
-(void)flock:(NSArray*)vehicles;
@end
