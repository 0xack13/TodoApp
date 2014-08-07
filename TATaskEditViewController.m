//
//  TATaskEditViewController.m
//  TodoApp
//
//  Created by 0xack13 on 8/7/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "TATaskEditViewController.h"
#import "TATask.h"

@interface TATaskEditViewController ()

@end

@implementation TATaskEditViewController

@synthesize nameField = _nameField;
@synthesize doneSwitch = _doneSwitch;
@synthesize task = _task;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.nameField.text = self.task.name;
    [self.doneSwitch setOn:self.task.done];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (void) taskDataChanged:(id)sender {
    self.task.name = self.nameField.text;
    self.task.done = self.doneSwitch.isOn;
    
}

@end
