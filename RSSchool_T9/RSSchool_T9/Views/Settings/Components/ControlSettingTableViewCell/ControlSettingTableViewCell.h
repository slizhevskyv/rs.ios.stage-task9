//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "BaseSettingTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ControlSettingTableViewCell : BaseSettingTableViewCell

- (void) configureCellWithSettingItem:(SettingItem *)item andControlHandler:(SEL)controlHandler;


@end

NS_ASSUME_NONNULL_END
