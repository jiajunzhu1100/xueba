//
//  testTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/10.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//



#import "cccViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"


@interface testTableViewController : UITableViewController


@property(strong,nonatomic)NSMutableArray *getArr;
@property(nonatomic)NSInteger lastPageNum;




@property(weak,nonatomic)NSString *nameget;
@property(weak,nonatomic)NSString *directorget;
@property(weak,nonatomic)NSString *actorget;
@property(weak,nonatomic)NSString *introget;

@end
