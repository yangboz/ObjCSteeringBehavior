//
//  GPViewController.h
//  ObjCSteeringBehaviorDemo
//

//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GPViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *steeringBehaviours;
}
@property(retain,nonatomic)IBOutlet UIPickerView *behaviorsPickerView;
@end
