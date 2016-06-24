//
//  ShutterstockCommunicatorDelegate.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShutterstockCommunicatorDelegate

- (void)receivedGroupsJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

- (void)receivedImagesJSON:(NSData *)objectNotation;
- (void)fetchingImagesFailedWithError:(NSError *)error;

@end
