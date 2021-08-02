//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, assign) BOOL isOn;

-(instancetype)initWithTitle:(NSString *)title subtitle:(nullable NSString *)subtitle isOn:(BOOL)isOn;

@end

NS_ASSUME_NONNULL_END
