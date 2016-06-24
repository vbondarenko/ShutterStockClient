//
//  GroupBuilder.m
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import "GroupBuilder.h"
#import "Categories.h"
#import "Images.h"

@implementation GroupBuilder

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    //NSLog(@"NSDICTIONARY: %@", parsedObject);
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *categories = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"data"];
    //NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary *groupDic in results) {
        
        Categories *category = [[Categories alloc] init];
        
        for (NSString *key in groupDic) {
            if ([category respondsToSelector:NSSelectorFromString(key)]) {
                [category setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        
        [categories addObject:category];
    }
    
    return categories;
}

+ (NSArray *)imagesFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    //NSLog(@"NSDICTIONARY: %@", parsedObject);
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"data"];
    //NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary *groupDic in results) {
        //NSLog(@"groupDic: %@", groupDic);
        NSArray *resultsAssets = [groupDic valueForKey:@"assets"];
        //NSLog(@"resultsAssets: %@", [resultsAssets valueForKey:@"preview"]);
        Images *image = [[Images alloc] init];
        
        for (NSString *key in  [resultsAssets valueForKey:@"preview"]) {
            //NSLog(@"resultsAssets: %@", key);
            if ([image respondsToSelector:NSSelectorFromString(key)]) {
                [image setValue:[[resultsAssets valueForKey:@"preview"] valueForKey:key] forKey:key];
            }
        }
        [images addObject:image];
    }
    return images;
}

@end
