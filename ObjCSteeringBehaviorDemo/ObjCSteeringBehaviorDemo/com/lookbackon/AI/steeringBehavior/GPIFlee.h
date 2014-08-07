//
//  GPIFlee.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIFlee <NSObject>
@required
-(void)flee:(Vector2D*)target;
@end
