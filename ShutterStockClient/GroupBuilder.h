//
//  GroupBuilder.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;

+ (NSArray *)imagesFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
