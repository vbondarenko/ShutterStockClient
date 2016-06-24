//
//  ShutterstockManager.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShutterstockManagerDelegate.h"
#import "ShutterstockCommunicatorDelegate.h"

@class ShutterstockCommunicator;

@interface ShutterstockManager : NSObject <ShutterstockCommunicatorDelegate>
@property (strong, nonatomic) ShutterstockCommunicator *communicator;
@property (weak, nonatomic) id<ShutterstockManagerDelegate> delegate;

- (void)fetchCategories;
- (void)fetchImages:(NSString *)category;

@end
