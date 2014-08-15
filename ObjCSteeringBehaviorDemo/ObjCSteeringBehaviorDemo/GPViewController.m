//
//  GPViewController.m
//  ObjCSteeringBehaviorDemo
//
//  Created by yangboz on 14-8-7.
//  Copyright (c) 2014年 GODPAPER. All rights reserved.
//

#import "GPViewController.h"
#import "GPMyScene.h"

@implementation GPViewController
//
GPMyScene *scene;
//
@synthesize behaviorsPickerView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    scene = [GPMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    //UIKit
    steeringBehaviours = [[NSArray alloc] initWithObjects:@"Arrive",@"Avoid",@"Evade",@"Flee",@"FollowPath",@"Flock",@"Pursue",@"PursueEvade",@"Seek",@"SeekFlee_01",@"SeekFlee_02",@"Wander",nil];
    //Connect data
    self.behaviorsPickerView.dataSource = self;
    self.behaviorsPickerView.delegate = self;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -UIPickerView
// The number of columns of data
- ( int ) numberOfComponentsInPickerView : ( UIPickerView * ) pickerView
{
    return 1 ;
}
// The number of rows of data
- ( int ) pickerView : ( UIPickerView * ) pickerView numberOfRowsInComponent : ( NSInteger ) component
{
    return steeringBehaviours.count;
}
// The data to return for the row and component (column) that's being passed in
- ( NSString * ) pickerView : ( UIPickerView * ) pickerView titleForRow : ( NSInteger ) row forComponent : ( NSInteger ) component
{
    return [steeringBehaviours objectAtIndex:row];
}
- ( void ) pickerView : ( UIPickerView * ) pickerView didSelectRow : ( NSInteger ) row inComponent : ( NSInteger ) component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    
    // The parameter named row and component represents what was selected.
    scene.selectedBehavior = [steeringBehaviours objectAtIndex:row];
}
@end
