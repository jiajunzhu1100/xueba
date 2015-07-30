//
//  dingdandetailViewController.h
//  test
//
//  Created by 郭正豪 on 15/5/12.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
@interface dingdandetailViewController : UIViewController<UIScrollViewDelegate>

@property(weak,nonatomic)NSString *getArr;



@property (weak, nonatomic) IBOutlet UILabel *ticketid;
@property (weak, nonatomic) IBOutlet UILabel *filmname;
@property (weak, nonatomic) IBOutlet UILabel *cinemaname;
@property (weak, nonatomic) IBOutlet UILabel *seat;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;


@property(strong,nonatomic)NSString *ticketidget;
@property(weak,nonatomic)NSString *filmnameget;
@property(weak,nonatomic)NSString *cinemanameget;
@property(weak,nonatomic)NSString *seatget;
@property(weak,nonatomic)NSString *numberget;
@property(weak,nonatomic)NSString *timeget;
@property(weak,nonatomic)NSString *priceget;

@end
