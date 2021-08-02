//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "StrokeColorsViewController.h"
#import "StrokeColorTableViewCell.h"

NSString *const StrokeColorCellIndentifier = @"StrokeColorCellIndentifier";

@interface StrokeColorsViewController ()

@property (nonatomic) NSArray<NSString *> *colors;

@end

@implementation StrokeColorsViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		_colors = @[
			@"#be2813",
			@"#3802da",
			@"#467c24",
			@"#808080",
			@"#8e5af7",
			@"#f07f5a",
			@"#f3af22",
			@"#3dacf7",
			@"#e87aa4",
			@"#0f2e3f",
			@"#213711",
			@"#511307",
			@"#92003b",
		];
	}
	return self;
}

- (instancetype)initWithCurrentColor:(NSString *)currentColor {
	self = [self init];
	if (self) {
		_currentColor = currentColor;
	}
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor whiteColor];
	[self setupTableView];
}

#pragma mark -TableView Setup
-(void)setupTableView {
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
	
	[tableView registerClass:[StrokeColorTableViewCell class] forCellReuseIdentifier:StrokeColorCellIndentifier];
	
	tableView.dataSource = self;
	tableView.delegate = self;
	
	[self.view addSubview:tableView];
	
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[NSLayoutConstraint activateConstraints: @[
		[tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
		[tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
		[tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
		[tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
	]];
}

#pragma mark -TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	StrokeColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StrokeColorCellIndentifier];
	
	NSString *color = self.colors[indexPath.row];
	[cell configureWithColor:color isChecked:[color isEqualToString:self.currentColor]];
	
	return cell;
}

#pragma mark TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.delegate strokeColorDidSelect:self.colors[indexPath.row]];
	[self.navigationController popViewControllerAnimated:YES];
}

@end
