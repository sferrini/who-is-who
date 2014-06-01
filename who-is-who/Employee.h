//
//  Employee.h
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *job;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *imageURL;

@end
