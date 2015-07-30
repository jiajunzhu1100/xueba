//
//  movietimeTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/6/2.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBXML.h"
#import "AFNetworking.h"

@interface movietimeTableViewController : UITableViewController

- (IBAction)cancel:(id)sender;

@property(strong,nonatomic)NSMutableArray *getArr;
@property(strong,nonatomic)NSMutableArray *Arr1;
@property(strong,nonatomic)NSIndexPath *path;


@property(weak,nonatomic)NSString *cinemanameget;
@property(nonatomic)NSInteger *cui;
@property(nonatomic)NSInteger *cuicui;
@property(strong,nonatomic)NSString *time;

@end
