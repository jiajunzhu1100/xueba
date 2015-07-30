//
//  ftcTableViewCell.m
//  test
//
//  Created by 郭正豪 on 15/5/31.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "ftcTableViewCell.h"

@implementation ftcTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.scroll.delegate=self;
    CGFloat width=self.scroll.bounds.size.width;
    CGFloat height=self.scroll.bounds.size.height;
  
    [self.scroll setBounces:NO];
    [self.scroll setShowsHorizontalScrollIndicator:NO];
    [self.scroll setContentSize:CGSizeMake(5*width, height)];
    [self.scroll setPagingEnabled:YES];

    
    UIButton *bb1=[UIButton buttonWithType:UIButtonTypeCustom];
    bb1.frame=CGRectMake(10, 20, 50, 50);
    [bb1 setTitle:@"点击" forState:UIControlStateNormal];
    [bb1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb1 addTarget:self action:@selector(bc) forControlEvents:UIControlEventTouchUpInside];
    bb1.tag=1;
    self.scroll.backgroundColor=[UIColor whiteColor];
    [self.scroll addSubview:bb1];
    
    UIButton *bb2=[UIButton buttonWithType:UIButtonTypeCustom];
    bb2.frame=CGRectMake(90, 20, 50, 50);
    [bb2 setTitle:@"点击" forState:UIControlStateNormal];
    [bb2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb2 addTarget:self action:@selector(bc) forControlEvents:UIControlEventTouchUpInside];
    bb2.tag=2;
    self.scroll.backgroundColor=[UIColor whiteColor];
    [self.scroll addSubview:bb2];
    
    
    UIButton *bb3=[UIButton buttonWithType:UIButtonTypeCustom];
    bb3.frame=CGRectMake(170, 20, 50, 50);
    [bb3 setTitle:@"点击" forState:UIControlStateNormal];
    [bb3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb3 addTarget:self action:@selector(bc) forControlEvents:UIControlEventTouchUpInside];
    bb3.tag=3;
    self.scroll.backgroundColor=[UIColor whiteColor];
    [self.scroll addSubview:bb3];
    
    
    UIButton *bb4=[UIButton buttonWithType:UIButtonTypeCustom];
    bb4.frame=CGRectMake(250, 20, 50, 50);
    [bb4 setTitle:@"点击" forState:UIControlStateNormal];
    [bb4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb4 addTarget:self action:@selector(bc) forControlEvents:UIControlEventTouchUpInside];
    bb4.tag=4;
    self.scroll.backgroundColor=[UIColor whiteColor];
    [self.scroll addSubview:bb4];

}
-(void)bc{
    UIAlertView *doit=[[UIAlertView alloc]initWithTitle:nil message:@"hello" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    
    [doit show];
    
}

@end
