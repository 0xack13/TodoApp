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
@synthesize taskEntity = _taskEntity;

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
    
    //Without Core Data
    //self.nameField.text = self.task.name;
    //[self.doneSwitch setOn:self.task.done];
    
    self.nameField.text = self.taskEntity.title;
    [self.doneSwitch setOn:self.taskEntity.isDone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (void) taskDataChanged:(id)sender {
    //self.task.name = self.nameField.text;
    //self.task.done = self.doneSwitch.isOn;
    
    self.taskEntity.title = self.nameField.text;
    self.taskEntity.isDone = [NSNumber numberWithBool:self.doneSwitch.isOn];
}

@end
