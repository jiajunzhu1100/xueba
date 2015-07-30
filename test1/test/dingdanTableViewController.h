//
//  dingdanTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/13.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dingdandetailViewController.h"
#import "UIImageView+WebCache.h"
@interface dingdanTableViewController : UITableViewController

@property(strong,nonatomic)NSMutableArray *getArr;
@property(nonatomic)NSInteger lastPageNum;

@end
