//
//  secondTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/9.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "TBXML.h"
@interface secondTableViewController : UITableViewController<UIAlertViewDelegate>
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *un;
@property (weak, nonatomic) IBOutlet UITextField *pw;
@property(weak, nonatomic)NSArray *getuserandpass;
- (IBAction)login:(UIButton *)sender;

@end
