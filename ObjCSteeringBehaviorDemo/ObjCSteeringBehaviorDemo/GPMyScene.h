//
//  GPMyScene.h
//  ObjCSteeringBehaviorDemo
//

//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "com/lookbackon/AI/steeringBehavior/GPVehicle.h"
#import "com/lookbackon/AI/steeringBehavior/GPSteeredVehicle.h"
#define kPI         3.1415926535897932384626433832795f
@interface GPMyScene : SKScene
{
}
@property(retain,nonatomic)NSString *selectedBehavior;
@end
