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
BOOL spriteAdded = NO;
//
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        GPVehicle *sprite = [GPVehicle spriteNodeWithImageNamed:@"Spaceship"];
//        sprite = [GPSteeredVehicle spriteNodeWithImageNamed:@"Spaceship"];
        sprite = [[GPSteeredVehicle alloc] initWithImageNamed:@"Spaceship"];
        sprite.position = location;
        [sprite initVariables];//SteeredBehavior variables init;
        [sprite setXScale:0.1];
        [sprite setYScale:0.1];
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
//        [sprite runAction:[SKAction repeatActionForever:action]];
        if(!spriteAdded)
        {
            [self addChild:sprite];
            spriteAdded = YES;
        }
        Vector2D *newPosition = [[Vector2D alloc] initWithX:location.x  Y:location.y];
        if(sprite!=NULL)
        {
            [sprite arrive:newPosition];
//            [sprite update];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    //ArriveTest
    
}

@end
