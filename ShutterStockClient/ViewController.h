//
//  ViewController.h
//  ShutterStockClient
//
//  Created by vladimir on 4/25/16.
//  Copyright © 2016 vb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

