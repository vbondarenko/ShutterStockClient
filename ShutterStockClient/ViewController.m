//
//  ViewController.m
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import "ViewController.h"
#import "ImagesViewController.h"

#import "Categories.h"
#import "Images.h"
#import "ShutterstockManager.h"
#import "ShutterstockCommunicator.h"

@interface ViewController () <ShutterstockManagerDelegate> {
    NSArray *_categories;
    NSArray *_images;
    ShutterstockManager *_manager;
}

@property (nonatomic, strong) NSMutableArray *categoryArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[ShutterstockManager alloc] init];
    _manager.communicator = [[ShutterstockCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [self startFetchingCategories];
}

- (void)startFetchingCategories
{
    [_manager fetchCategories];
}

- (void)didReceiveGroups:(NSArray *)categories
{
    _categories = categories;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Categories *category = _categories[indexPath.row];
    cell.textLabel.text = category.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Images"])
    {
        NSIndexPath *currentIndex = [self.tableView indexPathForSelectedRow];
        NSString *stringIndex = [NSString stringWithFormat:@"%ld",(long)currentIndex.row];
        
        Categories *category = _categories[currentIndex.row];
    
        ImagesViewController *ivc = [segue destinationViewController];
        ivc.currentId = stringIndex;
        ivc.categoryName = category.name;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
