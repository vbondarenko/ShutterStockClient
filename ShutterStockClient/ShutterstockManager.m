//
//  ShutterstockManager.m
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import "ShutterstockManager.h"
#import "GroupBuilder.h"
#import "ShutterstockCommunicator.h"

@implementation ShutterstockManager

- (void)fetchCategories
{
    [self.communicator fetchCategories];
}

- (void)fetchImages:(NSString *)category
{
    [self.communicator fetchImages:category];
}

#pragma mark - MeetupCommunicatorDelegate

- (void)receivedGroupsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *groups = [GroupBuilder groupsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingGroupsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveGroups:groups];
    }
}

- (void)receivedImagesJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *images = [GroupBuilder imagesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingImagesFailedWithError:error];
        
    } else {
        [self.delegate didReceiveImages:images];
    }
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    [self.delegate fetchingGroupsFailedWithError:error];
}

- (void)fetchingImagesFailedWithError:(NSError *)error
{
    [self.delegate fetchingImagesFailedWithError:error];
}

@end
