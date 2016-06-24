//
//  ImagesViewController.h
//  ShutterStockClient
//
//  Created by vladimir on 4/26/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSString *currentId;
@property (strong, nonatomic) NSString *categoryName;

@end
