//
//  dingdandetailViewController.m
//  test
//
//  Created by 郭正豪 on 15/5/12.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "dingdandetailViewController.h"
#import "TBXML.h"
#import "AFNetworking.h"

@interface dingdandetailViewController ()

@end

@implementation dingdandetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.scrollview.delegate=self;
    CGFloat width=self.scrollview.bounds.size.width;
    CGFloat height=self.scrollview.bounds.size.height;
    [self.scrollview setContentSize:CGSizeMake(0, height*5)];
    //创建一个导航栏集合
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    
    //创建一个左边按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左边"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(clickLeftButton)];
//    
//    创建一个右边按钮
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右边"
//                                                                    style:UIBarButtonItemStyleDone
//                                                                   target:self
//                                                                   action:@selector(clickRightButton)];
    //设置导航栏内容
    
    
    self.ticketid.text=self.ticketidget;
    self.filmname.text=self.filmnameget;
    self.cinemaname.text=self.cinemanameget;
    self.number.text=self.numberget;
    self.seat.text=self.seatget;
    self.time.text=self.timeget;
    self.price.text=self.priceget;
    
    NSLog(@"%@",self.ticketidget);
//    [self queryImage:^(id res){[cell1.image2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res]] placeholderImage:[UIImage imageNamed:@"fulian.jpg"]];} andJ:[[self.getArr objectAtIndex:indexPath.row]objectForKey:@"filmname"]];
    [self queryImage:^(id res){[self.image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res] ]placeholderImage:[UIImage imageNamed:@"fulian.jpg"]];} andJ:self.filmname.text];
     
    [navigationItem setTitle:@"我的订单"];
    
    
    //把导航栏集合添加入导航栏中，设置动画关闭
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //把左右两个按钮添加入导航栏集合中
    [navigationItem setLeftBarButtonItem:leftButton];
//    [navigationItem setRightBarButtonItem:rightButton];
    
    //把导航栏添加到视图中
    [self.view addSubview:navigationBar];
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    
    
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
        
        
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}

@end
