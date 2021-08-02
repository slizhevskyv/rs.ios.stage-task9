//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingItem.h"

@implementation SettingItem

- (instancetype)initWithTitle:(NSString *)title subtitle:(nullable NSString *)subtitle isOn:(BOOL)isOn {
	self = [super init];
	if (self) {
		_title = title;
		_subTitle = subtitle;
		_isOn = isOn;
	}
	
	return self;
}

@end
