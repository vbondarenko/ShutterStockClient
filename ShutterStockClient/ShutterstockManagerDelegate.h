//
//  ShutterstockManagerDelegate.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShutterstockManagerDelegate

@optional
- (void)didReceiveGroups:(NSArray *)groups;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

- (void)didReceiveImages:(NSArray *)images;
- (void)fetchingImagesFailedWithError:(NSError *)error;

@end
