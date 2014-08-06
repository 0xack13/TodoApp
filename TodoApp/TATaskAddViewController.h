//
//  TATaskAddViewController.h
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATaskAddViewController : UITableViewController

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;

@property (nonatomic, strong) IBOutlet UITextField *nameField;

@end
