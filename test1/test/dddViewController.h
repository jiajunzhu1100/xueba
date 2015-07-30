//
//  dddViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "TBXML.h"
@interface dddViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)fanhui:(UIButton *)sender;
- (IBAction)goumai:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *cinema;
@property (weak, nonatomic) IBOutlet UILabel *seat;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *number;


@property(weak,nonatomic)NSString *nameget;
@property(strong,nonatomic)NSString *timeget;
@property(weak,nonatomic)NSString *cinemaget;
@property(nonatomic,strong)NSArray *seatget;
@property(weak,nonatomic)NSString *priceget;
@property(weak,nonatomic)NSString *numberget;

-(void)insertdd:(void(^)(id result))block andFilmname:(NSString *)filmname andCinemaname:(NSString *)cinemaname andNumber:(NSString *)number andSeat:(NSString *)seat;
@end
