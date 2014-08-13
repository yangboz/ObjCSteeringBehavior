//
//  GPMyScene.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPMyScene.h"

@implementation GPMyScene
GPSteeredVehicle *sprite=NULL;//SteeredVehicle;
CGSize winSize;
Vector2D *newPosition;
//
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Steered Behaviors!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        //
        winSize = size;
        //
        //        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        //        GPVehicle *sprite = [GPVehicle spriteNodeWithImageNamed:@"Spaceship"];
        //        sprite = [GPSteeredVehicle spriteNodeWithImageNamed:@"Spaceship"];
        sprite = [[GPSteeredVehicle alloc] initWithImageNamed:@"Spaceship"];
        sprite.position = CGPointMake(winSize.width/2, winSize.height/2);
        [sprite initVariables];//SteeredBehavior variables init;
        [sprite setXScale:0.1];
        [sprite setYScale:0.1];
        [sprite velocityV2D].length = 5;
        [sprite velocityV2D].angle = kPI / 4;
        //        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        //        [sprite runAction:[SKAction repeatActionForever:action]];
        [self addChild:sprite];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        //
        newPosition = [[Vector2D alloc] initWithX:location.x  Y:location.y];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    //ArriveTest
    /*
    CGFloat rX = 0 + arc4random_uniform(winSize.width - 0 + 1);
    CGFloat rY = 0 + arc4random_uniform(winSize.height - 0 + 1);
    CGPoint random = CGPointMake(rX, rY);
    //
    if(sprite!=NULL)
    {
        sprite.position = random;
    }
     */
    if(newPosition!=NULL)
    {
        sprite.position = CGPointMake(newPosition->x,newPosition->y);
//        [sprite arrive:newPosition];
//        [sprite update];
    }
}

@end
