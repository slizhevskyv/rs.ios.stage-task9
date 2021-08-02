//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "BaseSettingTableViewCell.h"

@interface BaseSettingTableViewCell ()

@property (nonatomic, readwrite) UIStackView *leftContainer;
@property (nonatomic, readwrite) UIStackView *rightContainer;

@end

@implementation BaseSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		[self setup];
	}
	
	return self;
}

-(void)setup {
	UIStackView *container = [UIStackView new];
	self.leftContainer = [UIStackView new];
	self.leftContainer.axis = UILayoutConstraintAxisVertical;
	self.leftContainer.distribution = UIStackViewDistributionFillEqually;
	self.rightContainer = [UIStackView new];
	
	[container addArrangedSubview:self.leftContainer];
	[container addArrangedSubview:self.rightContainer];
	
	[self.contentView addSubview:container];
	
	container.translatesAutoresizingMaskIntoConstraints = NO;
	[NSLayoutConstraint activateConstraints:@[
		[container.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:6.5],
		[container.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-32],
		[container.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-3.5],
		[container.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:19.5]
	]];
}

- (void)configureCellWithSettingItem:(SettingItem *)item {
	
}

@end
