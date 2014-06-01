//
//  EmployeeCreator.h
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TFHpple.h"
#import "Employee.h"
#import "EmployeeDownloader.h"

typedef void (^CreatorCompletionHandler)(NSArray *employees);

@interface EmployeeCreator : NSObject

- (void)createEmployeesWithCompletionHandler:(CreatorCompletionHandler)completionHandler;

@end
