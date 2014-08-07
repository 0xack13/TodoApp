//
//  TATaskListViewController.h
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATaskListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *tasks;

- (IBAction)editButtonPressed:(id)sender;

@end
