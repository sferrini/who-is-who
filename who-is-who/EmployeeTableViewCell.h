//
//  EmployeeTableViewCell.h
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UIImageView *photoEmployeeView;

- (void)configureCellWithImage:(UIImage *)photoEmployee;

@end
