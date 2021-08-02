//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "StrokeColorTableViewCell.h"
#import "UIColor+HexFormat.h"

@interface StrokeColorTableViewCell ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIImageView *checkView;

@end

@implementation StrokeColorTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setupLayout];
	}
	
	return self;
}

-(void)setupLayout {
	UIStackView *container = [UIStackView new];
	
	self.titleLabel = [UILabel new];
	self.checkView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"checkmark"]];
	self.checkView.tintColor = [UIColor colorNamed:@"Red"];
	self.checkView.hidden = YES;
	
	[container addArrangedSubview:self.titleLabel];
	[container addArrangedSubview:self.checkView];
	
	[self.contentView addSubview:container];
	container.translatesAutoresizingMaskIntoConstraints = NO;
	[NSLayoutConstraint activateConstraints:@[
		[container.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10.5],
		[container.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20.5],
		[container.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-22.5],
		[container.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-9.5],
	]];
}

- (void)configureWithColor:(NSString *)color isChecked:(BOOL)isChecked {
	self.titleLabel.text = color;
	self.titleLabel.textColor = [UIColor colorFromHexFormat:color];
	
	if (isChecked) {
		self.checkView.hidden = NO;
	}
}

@end
