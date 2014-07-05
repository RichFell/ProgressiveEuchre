//
//  AppDelegate.h
//  ProgressiveEuchre
//
//  Created by Richard Fellure on 7/4/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property MPCManager *mpcManager;
@property (strong, nonatomic) UIWindow *window;

@end
