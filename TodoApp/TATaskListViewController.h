//
//  TATaskListViewController.h
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TATaskEntity.h"

@interface TATaskListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic,strong)NSArray* fetchedTasksArray;

- (IBAction)editButtonPressed:(id)sender;

@end
