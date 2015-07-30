//
//  eeeTableViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/9.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "eeeTableViewController.h"
#import "secondTableViewController.h"
#import "SettingTableViewController.h"
@interface eeeTableViewController ()

@end

@implementation eeeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor orangeColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    NSUserDefaults *userinfo=[NSUserDefaults standardUserDefaults];
//    NSString *loginusername=[userinfo objectForKey:@"loginsucc"];
//    if ([loginusername isEqual:nil]) {
//        [self.logininorout setTitle:@"Login" forState:UIControlStateNormal];
        //to Loginout button
        
        //
        
//    }
//    [self.logininorout setTitle:@"LoginOut" forState:UIControlStateNormal];
    // to login in button
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signout:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    secondTableViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    
    [self.navigationController pushViewController:filmDetailViewController animated:YES];

}

- (IBAction)sheetview:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"呼叫 12345678",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
//-(void)showAlert:(NSString *)msg {
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:@"Action Sheet选择项"
//                          message:msg
//                          delegate:self
//                          cancelButtonTitle:@"确定"
//                          otherButtonTitles: nil];
//    [alert show];
//}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
//        [self showAlert:@"第一项"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://xxxxxxxx"]];
        
    }else if (buttonIndex == 1) {
        [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}
- (IBAction)setting:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    SettingTableViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"set"];
    
    [self.navigationController pushViewController:filmDetailViewController animated:YES];
}
@end
