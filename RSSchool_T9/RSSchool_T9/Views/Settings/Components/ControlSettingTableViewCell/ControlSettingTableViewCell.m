//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ControlSettingTableViewCell.h"
#import "SettingItem.h"

@interface ControlSettingTableViewCell()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UISwitch *switcher;

@end

@implementation ControlSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setupLayout];
		
		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	return self;
}

- (void)setupLayout {
	self.titleLabel = [UILabel new];
	self.switcher = [UISwitch new];
	
	[self.leftContainer addArrangedSubview:self.titleLabel];
	[self.rightContainer addArrangedSubview:self.switcher];
	
	self.rightContainer.alignment = UIStackViewAlignmentCenter;
};

- (void)configureCellWithSettingItem:(SettingItem *)item {
	self.titleLabel.text = item.title;
	self.switcher.on = item.isOn;
}

- (void)configureCellWithSettingItem:(SettingItem *)item andControlHandler:(SEL)controlHandler {
	[self configureCellWithSettingItem:item];
	
	[self.switcher addTarget:nil action:controlHandler forControlEvents:UIControlEventValueChanged];
}

@end
