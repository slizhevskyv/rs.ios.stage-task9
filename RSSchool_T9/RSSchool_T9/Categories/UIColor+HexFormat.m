//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+HexFormat.h"

@implementation UIColor (HexFormat)

+(instancetype)colorFromHexFormat:(NSString *)hexString; {
	UInt32 rgb = 0;
	
	NSMutableString *hex = [NSMutableString stringWithString:hexString];
	
	if ([hex hasPrefix:@"#"]) {
		[hex deleteCharactersInRange:NSMakeRange(0, 1)];
	} else {
		return [UIColor blackColor];
	}
	
	[[[NSScanner alloc] initWithString:hex] scanHexInt:&rgb];
	
	int red = (rgb >> 16) & 0xFF;
	int green = (rgb >> 8) & 0xFF;
	int blue = rgb & 0xFF;
	
	return [UIColor colorWithRed:(CGFloat)red / 255.0 green:(CGFloat)green / 255.0 blue:(CGFloat)blue / 255.0 alpha:1];
}

@end
