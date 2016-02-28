//
//  KVRMainTableViewController.h
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVRMainTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *mainTable;

@end
