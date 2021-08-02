//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SettingItem;

@interface BaseSettingTableViewCell : UITableViewCell

@property (nonatomic, readonly) UIStackView *leftContainer;
@property (nonatomic, readonly) UIStackView *rightContainer;

- (void)configureCellWithSettingItem:(SettingItem *)item;

@end

NS_ASSUME_NONNULL_END
