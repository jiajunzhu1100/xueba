//
//  ftcTableViewController.h
//  test
//
//  Created by 郭正豪 on 15/5/31.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "TBXML.h"
@interface ftcTableViewController : UITableViewController<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
@property(weak,nonatomic)NSArray *dataArray;
@property(strong,nonatomic)NSMutableArray *getArr;
@property(nonatomic)NSInteger lastPageNum;
@end
