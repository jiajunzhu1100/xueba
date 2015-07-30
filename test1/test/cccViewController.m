//
//  cccViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "cccViewController.h"
#import "dddViewController.h"
@interface cccViewController ()

@end

@implementation cccViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name.text=self.nameget;
    self.daoyan.text=self.daoyanget;
    self.jianjie.text=self.jianjieget;
    self.actor.text=self.actorget;
    self.shijian.text=self.timeget;
    self.type.text=self.typeget;
    [self queryImage:^(id res){[self.xueba setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res]] placeholderImage:[UIImage imageNamed:@"fulian.jpg"]];} andJ:self.nameget];
    
    self.navigationItem.title=(@"%@",self.name.text);
    
    self.hidesBottomBarWhenPushed=true;
    
    
    
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

- (IBAction)fanhui:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)goupiao:(UIButton *)sender {
    
        
    
        
        
        //    filmDetailViewController.preTag = btn.tag;
        //    filmDetailViewController.preState = stateButtonTag;
    
        
    
    NSUserDefaults *sr=[[NSUserDefaults standardUserDefaults] init];
    [sr setObject:self.nameget forKey:@"filmname"];
    
    
    }
-(void)queryImage:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns1:queryImage xmlns:ns1=\"http://image\"> \n"
                           "<ns1:name>%@</ns1:name> \n"
                           "</ns1:queryImage> \n"
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
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/ImageInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        NSLog(@"respone:%@",response);
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:queryImageResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        
        
        
        
        NSString *backPname=[TBXML textForElement:nsreutrn];
        
        if(block)block(backPname);
        //开始利用for循环来解析xml
        
        
        
        //            [temppp2 addObject:dict1];
        //
        //            nsreutrn=nsreutrn->nextSibling;
        //
        //
        //            //判断接下来有没有了
        //            if (nil==[TBXML childElementNamed:@"ax23:actorString" parentElement:nsreutrn]) {
        //                //                        UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        //                //                      [showNothing show];
        //                break;
        //            }
        
        //        }
        
        
        
        //        self.getArr=temppp2;
        //        if(block)block(temppp2);
        //
        //
        //
        //        [self.tableView reloadData];
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}

@end
