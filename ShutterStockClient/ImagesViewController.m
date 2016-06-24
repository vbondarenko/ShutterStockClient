//
//  ImagesViewController.m
//  ShutterStockClient
//
//  Created by vladimir on 4/26/16.
//  Copyright © 2016 vb. All rights reserved.
//
#define MAX_TIME_TO_WAIT_FOR_IMAGE 30.0

#import "ImagesViewController.h"
#import "ImagesViewController.h"

#import "Categories.h"
#import "Images.h"
#import "ImageCell.h"
#import "ShutterstockManager.h"
#import "ShutterstockCommunicator.h"

@interface ImagesViewController () <ShutterstockManagerDelegate> {
    NSArray *_images;
    ShutterstockManager *_manager;
}

@end

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.categoryName;
    
    _manager = [[ShutterstockManager alloc] init];
    _manager.communicator = [[ShutterstockCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [self startFetchingImages];
}

- (void)startFetchingImages
{
    [_manager fetchImages:self.currentId];
}

- (void)didReceiveImages:(NSArray *)images
{
    _images = images;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

- (void)fetchingImagesFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _images.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    Images *image = _images[indexPath.row];
    CGFloat widthImage = (CGFloat)[image.width floatValue];
    CGFloat heightImage = (CGFloat)[image.height floatValue];
    CGFloat aspect = widthImage / heightImage;
    CGFloat height = widthImage / aspect;
    
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    
    Images *image = _images[indexPath.row];
    NSURL *url = [NSURL URLWithString:image.url];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    ImageCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell)
                        updateCell.imageView.image = image;
                });
            }
        }
    }];
    [task resume];
    
    return cell;
}


@end
