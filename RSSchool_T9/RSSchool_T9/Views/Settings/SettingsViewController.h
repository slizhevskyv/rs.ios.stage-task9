//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/30/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "StrokeColorsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, StrokeColorViewControllerDelegate, UITabBarControllerDelegate>

@property (nonatomic, assign, readonly) BOOL drawStories;
@property (nonatomic, copy, readonly) NSMutableString *strokeColor;

@end

NS_ASSUME_NONNULL_END
