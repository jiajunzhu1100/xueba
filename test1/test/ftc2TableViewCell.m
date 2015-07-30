//
//  ftc2TableViewCell.m
//  test
//
//  Created by 郭正豪 on 15/6/2.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "ftc2TableViewCell.h"
#import "fViewController.h"
#import "movietimeTableViewController.h"
#import "fViewController.h"
@implementation ftc2TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


         // Configure the view for the selected state
}
-(void)turn:(UIButton *)sender{
    
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSString *trans2vc=[NSString stringWithFormat:@"%ld",(long)sender.tag];
    [nc postNotificationName:@"turn" object:sender userInfo:@{@"tag":trans2vc}];
    
    
    NSLog(@"11111111111111");
    

////    
////        UIAlertView *doit=[[UIAlertView alloc]initWithTitle:nil message:@"hello" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
////
////        [doit show];
//    
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
//    
//    fViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"f"];
////
//    movietimeTableViewController *f4dv=[storyboard instantiateViewControllerWithIdentifier:@"f4"];
//    
//    
//    [f4dv.navigationController pushViewController:filmDetailViewController animated:YES];
//    
////    [f4dv presentViewController:filmDetailViewController animated:YES completion:nil];
//}
//
//- (void) test:(NSNotification*) notification{
//    
//    NSLog(@"1111111111");
}
@end
