//
//  scrollViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/9.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "scrollViewController.h"

@interface scrollViewController ()

@end

@implementation scrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview.contentSize = CGSizeMake(400, 1200);
    // Do any additional setup after loading the view.
}
//- (void) viewDidAppear:(BOOL)animated
//{
//    [self.scrollview setContentOffset:CGPointMake(0, 100) animated:YES];
//    [super viewDidAppear:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
