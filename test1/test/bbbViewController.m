//
//  bbbViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "bbbViewController.h"



@interface bbbViewController ()

@end

@implementation bbbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSLog(@"daxuebadaxueba");
    
    
    
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

- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
   
}
- (IBAction)done:(UITextField *)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTap:(id)sender {
    [self.zhanghaoTxt resignFirstResponder];
    [self.mimTXT resignFirstResponder];
    [self.confirmTXT resignFirstResponder];
    [self.phoneTXT resignFirstResponder];
    [self.nicknameTXT resignFirstResponder];
}

- (IBAction)zhuce:(UIButton *)sender {
    //webservice
    [self insertUser:^(id res){ NSLog(@"result---------%@-----",res);
        if ([res isEqualToString:@"true"]) {
            UIAlertView *succ=[[UIAlertView alloc]initWithTitle:nil message:@"Success!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            succ.tag=1;
            [succ show];
//            self.phoneTXT.text=res;
            
        }else{
            
            UIAlertView *err=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [err show];
            
        }
        
        
    } andName:self.zhanghaoTxt.text andPass:self.mimTXT.text andNickName:self.nicknameTXT.text andTel:self.phoneTXT.text];
    //
}
//alertviewdid

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0 && alertView.tag==1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        self.zhanghaoTxt.text=@"";
        //学霸mission1
    }
    
}



//END





- (IBAction)fuack:(UIButton *)sender {
   
}
#pragma mark -webservice
//getData



//andName(参数申明):(NSString *)(参数类型)name(参数名称)



-(void)insertUser:(void(^)(id result))block andName:(NSString *)name andPass:(NSString *)pass andNickName:(NSString *)nickname andTel:(NSString *)tel {
    
//no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns5:insertUser xmlns:ns5=\"http://userinfo\"> \n"
                           "<ns5:name>%@</ns5:name> \n"
                           "<ns5:pass>%@</ns5:pass> \n"
                           "<ns5:nickname>%@</ns5:nickname> \n"
                           "<ns5:tel>%@</ns5:tel> \n"
                           "</ns5:insertUser> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",name,pass,nickname,tel];
    
    
    
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
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:insertUserResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        NSString *fanuui=[TBXML textForElement:nsreutrn];
        if(block)block(fanuui);
        //开始利用for循环来解析xml
        
//        for (int i=0; (nsreutrn->nextSibling) && i<self.lastPageNum ; i++) {
            
//            
//            TBXMLElement *axadd=[TBXML childElementNamed:@"ax223:add" parentElement:nsreutrn];
//            TBXMLElement *axcatalgory=[TBXML nextSiblingNamed:@"ax223:cataglory" searchFromElement:axadd];
//            TBXMLElement *axdesc=[TBXML nextSiblingNamed:@"ax223:desc" searchFromElement:axcatalgory];
//            TBXMLElement *axname=[TBXML nextSiblingNamed:@"ax223:name" searchFromElement:axdesc];
//            TBXMLElement *axneworOld=[TBXML nextSiblingNamed:@"ax223:neworOld" searchFromElement:axname];
//            TBXMLElement *axprice=[TBXML nextSiblingNamed:@"ax223:price" searchFromElement:axneworOld];
//            TBXMLElement *axrarePrice=[TBXML nextSiblingNamed:@"ax223:rarePrice" searchFromElement:axprice];
            
            
            
//            NSDictionary *dict1=@{@"name":[TBXML textForElement:axname],@"price":[TBXML textForElement:axprice],@"neworOlr":[TBXML textForElement:axneworOld],@"desc":[TBXML textForElement:axdesc],@"cataglory":[TBXML textForElement:axcatalgory],@"rarePrice":[TBXML textForElement:axrarePrice]};
        
            
//            [temppp2 addObject:dict1];
//            
//            nsreutrn=nsreutrn->nextSibling;
//            
        
            //判断接下来有没有了
//            if (nil==[TBXML childElementNamed:@"ax223:add" parentElement:nsreutrn]) {
//                UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//                [showNothing show];
//                break;
//            }
        
       // }
        
        
//        
//        self.getArr=temppp2;
//        
//        
//        [self.tableView reloadData];
//        
//        
//        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}






//END getData
@end
