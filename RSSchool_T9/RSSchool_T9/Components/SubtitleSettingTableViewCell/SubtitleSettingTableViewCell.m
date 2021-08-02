//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SubtitleSettingTableViewCell.h"
#import "SettingItem.h"
#import "UIColor+HexFormat.h"

@interface SubtitleSettingTableViewCell()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *subtitleLabel;

@end

@implementation SubtitleSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setupLayout];
	}
	
	return self;
}

- (void)setupLayout {
	self.titleLabel = [UILabel new];
	self.subtitleLabel = [UILabel new];
	self.subtitleLabel.font = [UIFont fontWithName:@"SFProDisplay-Regular" size:12];
	
	UIView *arrowContainer = [UIView new];
	UIImageView *arrowView = [[UIImageView alloc] initWithImage: [UIImage systemImageNamed:@"chevron.right"]];
	arrowView.tintColor = [UIColor colorNamed:@"Gray"];
	[arrowContainer addSubview:arrowView];
	
	[self.leftContainer addArrangedSubview:self.titleLabel];
	[self.leftContainer addArrangedSubview:self.subtitleLabel];
	[self.rightContainer addArrangedSubview:arrowContainer];
	
	arrowView.translatesAutoresizingMaskIntoConstraints = NO;
	[NSLayoutConstraint activateConstraints:@[
		[arrowView.centerYAnchor constraintEqualToAnchor:arrowContainer.centerYAnchor],
		[arrowView.trailingAnchor constraintEqualToAnchor:arrowContainer.trailingAnchor]
	]];
}

- (void)configureCellWithSettingItem:(SettingItem *)item {
	self.titleLabel.text = item.title;
	self.subtitleLabel.text = item.subTitle;
	self.subtitleLabel.textColor = [UIColor colorFromHexFormat:item.subTitle];
}

@end
