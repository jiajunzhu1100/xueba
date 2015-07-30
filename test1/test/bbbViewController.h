//
//  bbbViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//
#define InsertAdmin(func,namespace,name,password) [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n""<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\">\n""<soapenv:Body>\n""<ns1:%@ xmlns:ns1=\"http://%@\">\n""<ns1:name>%@</ns1:name>\n""<ns1:pass>%@</ns1:pass>\n""</ns1:%@>\n""</soapenv:Body>\n""</soapenv:Envelope>\n",func,namespace,name,password,func]
#import <UIKit/UIKit.h>

//!!!!
#import "AFNetworking.h"
#import "TBXML.h"
//
@interface bbbViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)cancel:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *zhanghaoTxt;
@property (weak, nonatomic) IBOutlet UITextField *mimTXT;
@property (weak, nonatomic) IBOutlet UILabel *labelChanged;
@property (weak, nonatomic) IBOutlet UITextField *confirmTXT;
@property (weak, nonatomic) IBOutlet UITextField *phoneTXT;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTXT;
- (IBAction)zhuce:(UIButton *)sender;
- (IBAction)fuack:(UIButton *)sender;

@end
