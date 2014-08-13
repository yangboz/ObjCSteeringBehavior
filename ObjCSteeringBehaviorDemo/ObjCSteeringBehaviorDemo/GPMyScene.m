//
//  GPMyScene.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPMyScene.h"

@implementation GPMyScene
GPSteeredVehicle *vehicle=NULL;//SteeredVehicle;
CGSize winSize;
Vector2D *newPosition;
//
@synthesize selectedBehavior;
//
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Steered Behaviors:";
        myLabel.fontSize = 20;
        myLabel.position = CGPointMake(CGRectGetMinX(self.frame)+110,CGRectGetMaxY(self.frame)-55);
        
        [self addChild:myLabel];
        //
        winSize = size;
        //
        //        SKSpriteNode *vehicle = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        //        GPVehicle *vehicle = [GPVehicle spriteNodeWithImageNamed:@"Spaceship"];
        //        vehicle = [GPSteeredVehicle spriteNodeWithImageNamed:@"Spaceship"];
        vehicle = [[GPSteeredVehicle alloc] initWithImageNamed:@"Spaceship"];
        vehicle.position = CGPointMake(0, 0);
        [vehicle initVariables];//SteeredBehavior variables init;
        [vehicle setXScale:0.1];
        [vehicle setYScale:0.1];
        [vehicle velocityV2D].length = 5;
        [vehicle velocityV2D].angle = kPI / 4;
        //        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        //        [sprite runAction:[SKAction repeatActionForever:action]];
        vehicle.winWidth =[[NSNumber alloc] initWithFloat:winSize.width];
        vehicle.winHeight =[[NSNumber alloc] initWithFloat:winSize.height];
        [self addChild:vehicle];
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
     */
    if(newPosition!=NULL)
    {
//        vehicle.position = random;
//        vehicle.position = CGPointMake(newPosition->x,newPosition->y);
        if ([selectedBehavior isEqualToString:@"Arrive"]) {
            [vehicle arrive:newPosition];
        }else if([selectedBehavior isEqualToString:@"Avoid"])
        {
//            [vehicle avoid:<#(NSArray *)#>
        }else if([selectedBehavior isEqualToString:@"Evade"])
        {
//            [vehicle evade:<#(GPVehicle *)#>
        }else if([selectedBehavior isEqualToString:@"Flee"])
        {
//            [vehicle flee:<#(Vector2D *)#>
        }else if([selectedBehavior isEqualToString:@"FollowPath"])
        {
//            [vehicle f
        }else if([selectedBehavior isEqualToString:@"Flock"])
        {
//            [vehicle flock:<#(NSArray *)#>
        }else if([selectedBehavior isEqualToString:@"Pursue"])
        {
//            [vehicle pursue:<#(GPVehicle *)#>
        }else if([selectedBehavior isEqualToString:@"Seek"])
        {
//            [vehicle seek:<#(Vector2D *)#>
        }else if([selectedBehavior isEqualToString:@"Wander"])
        {
            [vehicle wander];
        }else
        {
            //Unknow behaviors.
        }
        [vehicle update];
    }
}

@end
