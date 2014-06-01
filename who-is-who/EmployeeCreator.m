//
//  EmployeeCreator.m
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "EmployeeCreator.h"

@interface EmployeeCreator ()

@property (nonatomic, copy) CreatorCompletionHandler completionHandler;

@end

@implementation EmployeeCreator

- (void)createEmployeesWithCompletionHandler:(CreatorCompletionHandler)completionHandler
{
    (void)[[EmployeeDownloader alloc]initWithCompletionHandler:^(NSData *data) {
        
        TFHpple *htmlParser = [TFHpple hppleWithHTMLData:data];
        
        NSString *xPathQueryString = @"//div[@class='col col2']";
        NSArray *employeeNodes = [htmlParser searchWithXPathQuery:xPathQueryString];
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        for (TFHppleElement *element in employeeNodes) {
            [employees addObject:[self createEmployeeForElement:element]];
        }
        
        completionHandler(employees);
    }];
}

- (Employee*)createEmployeeForElement:(TFHppleElement *)element
{
    Employee *employee = [[Employee alloc] init];
    
    for (TFHppleElement *child in element.children) {
        if ([child.tagName isEqualToString:@"div"]) {
            for (TFHppleElement *grandchild in child.children) {
                if ([grandchild.tagName isEqualToString:@"img"]) {
                    employee.imageURL = [grandchild objectForKey:@"src"];
                }
            }
        } else if ([child.tagName isEqualToString:@"h3"]) {
            employee.name = [[child firstChild] content];
        } else if ([child.tagName isEqualToString:@"p"]) {
            
            if (employee.job.length == 0) {
                employee.job = [[child firstChild] content];
            } else {
                employee.description = [[child firstChild] content];
            }
        }
    }
    
    return employee;
}

@end
