//
//  aaaaViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#
@interface aaaaViewController : UIViewController
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *before;
@property (weak, nonatomic) IBOutlet UITextField *after;
@property (weak, nonatomic) IBOutlet UITextField *confirm;
- (IBAction)change:(UIButton *)sender;

- (IBAction)done:(UITextField *)sender;


@end
