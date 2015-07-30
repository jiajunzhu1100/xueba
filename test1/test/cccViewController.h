//
//  cccViewController.h
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "TBXML.h"
#import "UIImageView+WebCache.h"
@interface cccViewController : UIViewController 
- (IBAction)fanhui:(UIButton *)sender;
- (IBAction)goupiao:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *shijian;
@property (weak, nonatomic) IBOutlet UILabel *daoyan;
@property (weak, nonatomic) IBOutlet UILabel *actor;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UIImageView *xueba;
@property (weak, nonatomic) IBOutlet UILabel *type;



@property(weak,nonatomic)NSString *nameget;
@property(weak,nonatomic)NSString *timeget;
@property(weak,nonatomic)NSString *daoyanget;
@property(weak,nonatomic)NSString *actorget;
@property(weak,nonatomic)NSString *jianjieget;
@property(weak,nonatomic)NSString *typeget;
@end
