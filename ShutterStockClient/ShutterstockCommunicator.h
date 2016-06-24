//
//  ShutterstockCommunicator.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShutterstockCommunicatorDelegate;

@interface ShutterstockCommunicator : NSObject

@property (weak, nonatomic) id<ShutterstockCommunicatorDelegate> delegate;

- (void)fetchCategories;
- (void)fetchImages:(NSString *)category;

@end
