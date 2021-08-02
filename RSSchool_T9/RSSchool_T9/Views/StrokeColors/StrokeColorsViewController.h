//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StrokeColorViewControllerDelegate <NSObject>

-(void)strokeColorDidSelect:(NSString *)color;

@end

@interface StrokeColorsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSString *currentColor;
@property (nonatomic, weak) id<StrokeColorViewControllerDelegate> delegate;

-(instancetype)initWithCurrentColor:(NSString *)currentColor;

@end

NS_ASSUME_NONNULL_END
