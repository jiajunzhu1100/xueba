//
//  eeeTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/9.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eeeTableViewController : UITableViewController
- (IBAction)signout:(UIButton *)sender;
- (IBAction)sheetview:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *logininorout;
- (IBAction)setting:(id)sender;

@end
