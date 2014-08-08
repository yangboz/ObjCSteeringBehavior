//
//  GPCircle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GPCircle : SKSpriteNode
{
    NSNumber *_radius;
    float _color;
}
@property(retain,nonatomic)NSNumber *radius;
@property(retain,nonatomic)NSNumber *positionV2D;
@end
