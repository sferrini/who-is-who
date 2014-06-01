//
//  PeopleTableViewController.h
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EmployeeCreator.h"

@interface PeopleTableViewController : UITableViewController

@property EmployeeCreator *employeeCreator;
@property NSArray *employees;

@end
