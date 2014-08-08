//
//  GPIVehicle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GPIVehicle <NSObject>
@required
/**
 * Sets / gets what will happen if character hits edge.
 */
@property(retain,nonatomic) NSString *edgeBehavior;
/**
 * Sets / gets mass of character.
 */
@property(retain,nonatomic) NSNumber* mass;
/**
 * Sets / gets maximum speed of character.
 */
@property(retain,nonatomic) NSNumber* maxSpeed;
/**
 * Sets / gets position of character as a Vector2D.
 */
@property(retain,nonatomic) Vector2D *positionV2D;
/**
 * Sets / gets velocity of character as a Vector2D.
 */
@property(retain,nonatomic) Vector2D *velocityV2D;
/**
 * Sets x position of character. Overrides Sprite.x to set internal Vector2D position as well.
 */
//@property(retain,nonatomic) float x;
/**
 * Sets y position of character. Overrides Sprite.y to set internal Vector2D position as well.
 */
//@property(retain,nonatomic) float y;
/**
 * update vehicle 's properties.
 */
-(void)update;
@end
