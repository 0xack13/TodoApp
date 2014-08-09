//
//  TATaskEditViewController.h
//  TodoApp
//
//  Created by 0xack13 on 8/7/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TATaskEntity.h"

@class TATask;

@interface TATaskEditViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UISwitch *doneSwitch;
@property (nonatomic, strong) TATask *task;
@property (nonatomic, strong) TATaskEntity *taskEntity;

- (IBAction) taskDataChanged:(id)sender;

@end
