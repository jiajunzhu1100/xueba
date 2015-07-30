//
//  aaaaViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "aaaaViewController.h"
#import "TBXML.h"
#import "AFNetworking.h"
@interface aaaaViewController ()

@end

@implementation aaaaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)change:(UIButton *)sender {
        NSUserDefaults *userinfo=[NSUserDefaults standardUserDefaults];
        NSString *loginusername=[userinfo objectForKey:@"loginsucc"];
    if ([self.after.text isEqualToString:self.confirm.text]) {
        [self updatePass:^(id res){
            if ([res isEqualToString:@"true"]) {
                UIAlertView *succ=[[UIAlertView alloc]initWithTitle:nil message:@"Success!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
                succ.tag=1;
                [succ show];
            }else{
                
                UIAlertView *err=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
                [err show];
                
            }
        }andPass:self.after.text andname:loginusername];
    }else{
        UIAlertView *fail=[[UIAlertView alloc]initWithTitle:nil message:@"请输入相同的密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [fail show];
    }
    
}

- (IBAction)done:(UITextField *)sender {
}

- (IBAction)backgroundTap:(id)sender {
    [self.before resignFirstResponder];
    [self.after resignFirstResponder];
    [self.confirm resignFirstResponder];
}

//update
-(void)updatePass:(void(^)(id result))block andPass:(NSString *)pass andname:(NSString *)name  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns2:updatePass xmlns:ns2=\"http://userinfo\"> \n"
                           "<ns2:pass>%@</ns2:pass> \n"
                           "<ns2:name>%@</ns2:name> \n"
                           "</ns2:updatePass> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",pass,name];
    
    
    
    NSLog(@"soapMeeage-----UpdatePAss:%@",soapMessage);
    
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
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:updatePassResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        if(block)block([TBXML textForElement:nsreutrn]);
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}

//end






@end
