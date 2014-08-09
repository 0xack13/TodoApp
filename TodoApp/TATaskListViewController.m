//
//  TATaskListViewController.m
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "TATaskListViewController.h"
#import "TATask.h"
#import "TATaskAddViewController.h"
#import "TATaskEditViewController.h"

@interface TATaskListViewController ()

@end

@implementation TATaskListViewController

@synthesize tasks = _tasks;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.tasks = [[NSMutableArray alloc] init];
    
    //[self.tableView reloadData];
    
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    // Fetching Tasks and saving it in "fetchedTasksArray" object
    self.fetchedTasksArray = [appDelegate getAllTasks];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        UINavigationController *navCon = segue.destinationViewController;
        TATaskAddViewController *addTaskViewController = [navCon.viewControllers objectAtIndex:0];
        addTaskViewController.taskListViewController = self;
    } else if ([segue.identifier isEqualToString:@"EditNotDoneTaskSegue"] || [segue.identifier isEqualToString:@"EditDoneTaskSegue"]) {
        TATaskEditViewController *editTaskViewController = segue.destinationViewController;
        editTaskViewController.task = [self.tasks objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.tasks.count;
    
    return [self.fetchedTasksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NotDoneCellIdentifier = @"NotDoneTaskCell";
    static NSString *DoneCellIdentifier = @"DoneTaskCell";
    
    //TATask *currentTask = [self.tasks objectAtIndex:indexPath.row];
    TATaskEntity *currentTask = [self.fetchedTasksArray objectAtIndex:indexPath.row];
    
    //NSString *cellIdetifier = currentTask.done ? DoneCellIdentifier : NotDoneCellIdentifier;
    NSString *cellIdetifier = currentTask.isDone ? DoneCellIdentifier : NotDoneCellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = currentTask.name;
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@, %@ ",currentTask.title,currentTask.isDone,currentTask.created];

    
    return cell;
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    TATask *movedTask = [self.tasks objectAtIndex:fromIndexPath.row];
    [self.tasks removeObjectAtIndex:fromIndexPath.row];
    [self.tasks insertObject:movedTask atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - IBActions
- (void) editButtonPressed:(id)sender {
    self.editing = !self.editing;
}

@end
