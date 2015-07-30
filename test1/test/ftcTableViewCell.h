//
//  ftcTableViewCell.h
//  test
//
//  Created by 郭正豪 on 15/5/31.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "OTPageScrollView.h"
//#import "OTPageView.h"
@interface ftcTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cinemaname;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (strong,nonatomic)NSString *cinemanameget;
@end
