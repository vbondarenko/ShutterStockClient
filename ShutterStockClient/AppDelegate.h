//
//  AppDelegate.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void(^)(NSData *data))completionHandler;

@end

