//
//  fViewController.h
//  test
//
//  Created by 郭正豪 on 15/6/1.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fViewController : UIViewController<UIScrollViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)confirm:(id)sender;
//@property(strong,nonatomic)NSMutableArray *getArr;

@property(strong,nonatomic)NSString *seat;
@property(weak,nonatomic)NSString *pai;
@property(weak,nonatomic)NSString *lie;
@property(strong,nonatomic)NSMutableArray *seats;
@property(strong,nonatomic)NSString *s;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *screen;





@property(strong,nonatomic)UIAlertView *err1;
@property(strong,nonatomic)UIAlertView *err2;
@property(strong,nonatomic)NSString *cinemanameget;
@property(strong,nonatomic)NSString *shijianget;
@end
