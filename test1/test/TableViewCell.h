//
//  TableViewCell.h
//  test
//
//  Created by 郭正豪 on 15/4/10.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UILabel *star;
@property (weak, nonatomic) IBOutlet UILabel *actor;



@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
