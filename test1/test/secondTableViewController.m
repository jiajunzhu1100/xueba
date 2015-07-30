//
//  secondTableViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/9.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "secondTableViewController.h"
#import "eeeTableViewController.h"
@interface secondTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernametxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordtxt;

@end

@implementation secondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



-(void)queryAll:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns2:queryUser xmlns:ns2=\"http://userinfo\"> \n"
                           "<ns2:name>%@</ns2:name> \n"
                           "</ns2:queryUser> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",j];
    
    
    
    NSLog(@"soapMeeage:%@",soapMessage);
    
    NSString *soapLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    
    
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return soapMessage;
    }];
    
    
    
    
    
    // http://localhost:8080/axis2/services/UserInfo
    
    
    //no 2
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/UserInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        NSLog(@"respone:%@",response);
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:queryUserResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        NSArray *arrayxb=[[NSArray alloc]init];
        if (nsreutrn==nil) {
            UIAlertView *all=[[UIAlertView alloc]initWithTitle:nil message:@"NOT EXISTS" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [all show];
            arrayxb=[NSArray arrayWithObjects:@"no",@"no",nil];
            
            
        }else{
            TBXMLElement *nsreturn=[TBXML nextSiblingNamed:@"ns:return" searchFromElement:nsreutrn];
            
            //NSMutableArray arrayxb=[];
            
            if (nsreturn==nil) {
                
                
                
                //
                
                //
                UIAlertView *all=[[UIAlertView alloc]initWithTitle:nil message:@"NOT EXISTS" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
                [all show];
                arrayxb=[NSArray arrayWithObjects:@"no",@"no",nil];
            }else {
                arrayxb=[NSArray arrayWithObjects:[TBXML textForElement:nsreutrn],[TBXML textForElement:nsreturn], nil];
            }

        }
                //[TBXML textForElement:nsreutrn],[TBXML textForElement:nsreturn]
        if(block)block(arrayxb);
        //开始利用for循环来解析xml
        
            //判断接下来有没有了
       // self.getuserandpass=arrayxb;
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}
//jieshule







- (IBAction)done:(id)sender {
    [sender resignFirstResponder];
    
    
    
    
    
    
}
- (IBAction)backgroundTap:(id)sender {
    [self.un resignFirstResponder];
    [self.pw resignFirstResponder];
}
- (IBAction)login:(UIButton *)sender {
    
    [self queryAll:^(id res){
        NSString *username=[res objectAtIndex:0];
        NSString *pass=[res objectAtIndex:1];
        NSLog(@"username:%@----pass=%@---",username,pass);
        if ([self.pw.text isEqualToString:pass]) {
            //
            [[NSUserDefaults standardUserDefaults] setObject:self.usernametxt.text forKey:@"loginsucc"];
            
            UIAlertView *successLogin=[[UIAlertView alloc]initWithTitle:nil message:@"Login YES" delegate:self cancelButtonTitle:nil otherButtonTitles:@"sure", nil];
            [successLogin show];
            
        }else{
            UIAlertView *errorLogin=[[UIAlertView alloc]initWithTitle:nil message:@"Login ERROR" delegate:self cancelButtonTitle:nil otherButtonTitles:@"sure", nil];
            [errorLogin show];
        }
    
    
    } andJ:self.un.text];
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
    
}



@end
