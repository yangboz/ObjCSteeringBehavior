//
//  GPISeek.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPISeek <NSObject>
@required
-(void)seek:(Vector2D*)target;
@end
