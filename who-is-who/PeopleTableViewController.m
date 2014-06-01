//
//  PeopleTableViewController.m
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "PeopleTableViewController.h"

#import "EmployeeTableViewCell.h"

@interface PeopleTableViewController ()

@end

@implementation PeopleTableViewController

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
    
    self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    
    [self refreshEmployeesArray];
}

- (void)refreshEmployeesArray {
    if (!self.employeeCreator) {
        self.employeeCreator = [[EmployeeCreator alloc]init];
    }
    
    [self.employeeCreator createEmployeesWithCompletionHandler:^(NSArray *employees) {
        self.employees = employees;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                                  forIndexPath:indexPath];
    
    
    Employee *thisEmployee = [self.employees objectAtIndex:indexPath.row];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    cell.imageView.image = nil;
    
    [cell configureCellWithImage:[UIImage imageNamed:@"logo-large"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:thisEmployee.imageURL]]];
        
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    EmployeeTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell)
                        [cell configureCellWithImage:image];
                });

        }
    });
    
    [cell.nameLabel setText:thisEmployee.name];
    [cell.jobLabel setText:thisEmployee.job];
    [cell.descriptionTextView setText:thisEmployee.description];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
