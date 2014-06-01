//
//  EmployeeTableViewCell.m
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "EmployeeTableViewCell.h"

@implementation EmployeeTableViewCell

- (void)configureCellWithImage:(UIImage *)photoEmployee
{
    self.photoEmployeeView.image = photoEmployee;
    self.photoEmployeeView.layer.cornerRadius = self.photoEmployeeView.frame.size.width / 2.0;
    self.photoEmployeeView.clipsToBounds = YES;
    self.photoEmployeeView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.photoEmployeeView.layer.borderWidth = 0.75f;
    
    self.backgroundColor = [UIColor clearColor];
}

@end
