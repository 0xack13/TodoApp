//
//  TATaskAddViewController.m
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "TATaskAddViewController.h"

@interface TATaskAddViewController ()

@end

@implementation TATaskAddViewController

@synthesize nameField = _nameField;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void) cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void) doneButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
