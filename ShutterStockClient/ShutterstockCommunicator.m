//
//  ShutterstockCommunicator.m
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import "ShutterstockCommunicator.h"
#import "ShutterstockCommunicatorDelegate.h"

@implementation ShutterstockCommunicator

- (void)fetchCategories
{
    //https://api.shutterstock.com/v2/images/search?category=\(category.id)&page=1&perPage=20
    //https://api.shutterstock.com/v2/images/categories
    
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.shutterstock.com/v2/images/categories"];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    // Instantiate a session configuration object.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPAdditionalHeaders = @{@"Authorization" : @"Basic MDU5OTIxNGRkZDFmNjA1ZjEzNTg6NDU2MGU4OTczYWY3N2ZiZTg4NTA4MzcyNDViNjI0ZGUyOWMwYmFmMw"};
    
    // Instantiate a session object.
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // Create a data task object to perform the data downloading.
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            [self.delegate fetchingGroupsFailedWithError:error];
        } else {
            [self.delegate receivedGroupsJSON:data];
        }
    }];
    
    
    // Resume the task.
    [task resume];
}

- (void)fetchImages:(NSString *)category
{
    //https://api.shutterstock.com/v2/images/search?category=1&page=1&perPage=20
    
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.shutterstock.com/v2/images/search?category=%@&page=1&perPage=20",category];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    // Instantiate a session configuration object.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPAdditionalHeaders = @{@"Authorization" : @"Basic MDU5OTIxNGRkZDFmNjA1ZjEzNTg6NDU2MGU4OTczYWY3N2ZiZTg4NTA4MzcyNDViNjI0ZGUyOWMwYmFmMw"};
    
    // Instantiate a session object.
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // Create a data task object to perform the data downloading.
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            [self.delegate fetchingImagesFailedWithError:error];
        } else {
            [self.delegate receivedImagesJSON:data];
        }
    }];
    
    
    // Resume the task.
    [task resume];
}

@end
