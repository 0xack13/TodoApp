//
//  TATaskAddViewController.m
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "TATaskAddViewController.h"
#import "TATaskListViewController.h"
#import "TATask.h"
#import "AppDelegate.h"
#import "TATaskEntity.h"


@interface TATaskAddViewController ()


@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end

@implementation TATaskAddViewController

@synthesize nameField = _nameField;
@synthesize taskListViewController = _taskListViewController;

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
    
    //Coredata: 1
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    //CoreData: 2
    self.managedObjectContext = appDelegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void) cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
    
}

- (void) doneButtonPressed:(id)sender {
    TATask *newTask = [[TATask alloc] initWithName:self.nameField.text done:NO];
    [self.taskListViewController.tasks addObject:newTask];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.taskListViewController.tableView reloadData];
    
    //  1
    TATaskEntity *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"TATaskEntity"
                                                      inManagedObjectContext:self.managedObjectContext];
    //  2
    newEntry.title = self.nameField.text;
    newEntry.isDone = NO;
    newEntry.created = [NSDate date];

    
    //  3
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    //  4
    self.nameField.text = @"";
    
    //  5
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.taskListViewController.tableView reloadData];
}

@end
