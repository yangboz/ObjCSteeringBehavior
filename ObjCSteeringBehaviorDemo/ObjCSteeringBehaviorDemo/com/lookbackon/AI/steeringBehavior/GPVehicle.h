//
//  GPVehicle.h
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-8.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Vector2D.h"

// potential edge behaviors
#define WRAP @"wrap";
#define BOUNCE @"bounce";
/**
 * Base class for moving characters.
 */
@interface GPVehicle : SKSpriteNode
{
@public
    float rotation;
}
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
@property(retain,nonatomic) NSNumber* x;
/**
 * Sets y position of character. Overrides Sprite.y to set internal Vector2D position as well.
 */
@property(retain,nonatomic) NSNumber* y;
/**
 * update vehicle 's properties.
 */
-(void)update;
/**
 * Sets SKSpriteScene windowSize to bounce/wrap usage.
 */
@property(retain,nonatomic) NSNumber *winWidth;
/**
 * Sets SKSpriteScene windowSize to bounce/wrap usage.
 */
@property(retain,nonatomic) NSNumber *winHeight;
@end
