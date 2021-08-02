//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/30/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingItem.h"
#import "ControlSettingTableViewCell.h"
#import "SubtitleSettingTableViewCell.h"
#import "StrokeColorsViewController.h"
#import "SettingsViewController.h"

NSString *const DrawStoriesCell = @"DrawStoriesCell";
NSString *const StrokeColorCell = @"StrokeColorCell";

@interface SettingsViewController ()

@property (nonatomic, assign, readwrite) BOOL drawStories;
@property (nonatomic, copy, readwrite) NSMutableString *strokeColor;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSDictionary<NSString *, SettingItem *> *items;

@end

@implementation SettingsViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setupTabBar];
		[self setupNavigationBar];
		_drawStories = YES;
		_strokeColor = [NSMutableString stringWithString:@"#e87aa4"];
		_items = @{
			StrokeColorCell: [[SettingItem alloc] initWithTitle:@"Stroke color" subtitle:_strokeColor isOn:NO],
			DrawStoriesCell: [[SettingItem alloc] initWithTitle:@"Draw stories" subtitle:nil isOn:YES],
		};
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.view.backgroundColor = [UIColor colorNamed:@"Gray"];
	self.tabBarController.delegate = self;
	
	[self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSLog(@"Draw stories %d", self.drawStories);
}

-(void)setupTabBar {
	self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage systemImageNamed:@"gear"] selectedImage:nil];
}

-(void)setupNavigationBar {
	self.navigationItem.title = @"Settings";
}

-(void)setupTableView {
	self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
	
	self.tableView.scrollEnabled = NO;
	
	[self.tableView registerClass:ControlSettingTableViewCell.class forCellReuseIdentifier:DrawStoriesCell];
	[self.tableView registerClass:SubtitleSettingTableViewCell.class forCellReuseIdentifier:StrokeColorCell];
	
	[self.view addSubview:self.tableView];
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[NSLayoutConstraint activateConstraints: @[
		[self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
		[self.tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
		[self.tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
		[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
	]];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	NSString *identifier = [self getItemIdentifierByIndexPath:indexPath];
	SettingItem *settingItem = [self getSettingItemByIndexPath:indexPath];

	BaseSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	if ([cell respondsToSelector:@selector(configureCellWithSettingItem:andControlHandler:)]) {
		[(ControlSettingTableViewCell *)cell configureCellWithSettingItem:settingItem andControlHandler:@selector(drawStoriesHandler:)];
	} else {
		[cell configureCellWithSettingItem:settingItem];
	}

	return cell;
}

#pragma mark -Handlers
- (void)drawStoriesHandler:(UISwitch *)sender {
	self.drawStories = sender.isOn;
	self.items[DrawStoriesCell].isOn = sender.isOn;
}

#pragma mark -Helpers
- (NSString *)getItemIdentifierByIndexPath:(NSIndexPath *)indexPath {
	NSArray *itemKeys = [self.items allKeys];
	
	return itemKeys[indexPath.row];
}

- (SettingItem *)getSettingItemByIndexPath:(NSIndexPath *)indexPath {
	NSArray *itemValues = [self.items allValues];
	
	return itemValues[indexPath.row];
}

#pragma mark -TableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.items.count;
}

#pragma mark -TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *itemIdentifier = [self getItemIdentifierByIndexPath:indexPath];

	if ([itemIdentifier isEqualToString:StrokeColorCell]) {
		StrokeColorsViewController *strokeColorsVC = [[StrokeColorsViewController alloc] initWithCurrentColor:self.strokeColor];
		
		strokeColorsVC.delegate = self;
		
		[self.navigationController pushViewController:strokeColorsVC animated:YES];
	}
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -StrokeColorsVCDelegate
- (void)strokeColorDidSelect:(NSString *)color {
	self.strokeColor = [NSMutableString stringWithString:color];
	self.items[StrokeColorCell].subTitle = color;
	
	[self.tableView reloadData];
}
@end
