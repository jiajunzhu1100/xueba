//
//  dddViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/8.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "dddViewController.h"
#import "fViewController.h"
#import "AFNetworking.h"
#import "TBXML.h"
#import "testTableViewController.h"
@interface dddViewController ()

@end

@implementation dddViewController

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

-(void)viewWillAppear:(BOOL)animated{
    
    
    
    NSUserDefaults *srt=[[NSUserDefaults standardUserDefaults]init];
    NSLog(@"this is -----%@",[srt objectForKey:@"filmname"]);
    self.name.text=[srt objectForKey:@"filmname"];
    self.seat.text=[NSString stringWithFormat:@"( %@ )",[self.seatget componentsJoinedByString:@","]];
    self.number.text=[NSString stringWithFormat:@"%ld张",self.seatget.count];
    self.price.text=[NSString stringWithFormat:@"%ld元",self.seatget.count*100];
    self.cinema.text=self.cinemaget;
    self.time.text=self.timeget;
//    self.seat.text=[]
    if (self.seatget.count==0) {
        NSLog(@"nulllllll");
    }
    for (int i=0; i<self.seatget.count; i++) {
        
        NSLog(@"ss%@ss",[self.seatget objectAtIndex:i]);
    }
    
}



- (IBAction)goumai:(UIButton *)sender {
    NSMutableString *ticketnumber=[NSMutableString new];
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    [ticketnumber appendFormat:@"%@",locationString];
    NSLog(@"%@",ticketnumber);
    
    
    [self insertOrder:^(id res){ NSLog(@"result---------%@-----",res);
        if ([res isEqualToString:@"true"]) {
            UIAlertView *succ=[[UIAlertView alloc]initWithTitle:nil message:@"Success!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            succ.tag=1;
            [self.navigationController popToRootViewControllerAnimated:YES];
            [succ show];
        }else{
            
            UIAlertView *err=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR!!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [err show];
            
        }
    }andTicketid:ticketnumber andFilmname:self.name.text andCinemaname:self.cinema.text andNumber:self.number.text andSeat:self.seat.text andTime:self.time.text andTel:@"123" andPrice:self.price.text andUsername:@"gheicl"];
     }
     

//#pragma mark -webservice
//getData



//andName(参数申明):(NSString *)(参数类型)name(参数名称)


-(void)insertOrder:(void(^)(id result))block andTicketid:(NSString *)ticketid andFilmname:(NSString *)filmname andCinemaname:(NSString *)cinemaname andNumber:(NSString *)number andSeat:(NSString *)seat andTime:(NSString *)time andTel:(NSString *)tel andPrice:(NSString *)price andUsername:(NSString *)username  {
    
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns6:insertOrder xmlns:ns6=\"http://ticketinfo\"> \n"
                           "<ns6:ticketid>%@</ns6:ticketid> \n"
                           "<ns6:filmname>%@</ns6:filmname> \n"
                           "<ns6:cinemaname>%@</ns6:cinemaname> \n"
                           "<ns6:number>%@</ns6:number> \n"
                           "<ns6:seat>%@</ns6:seat> \n"
                           "<ns6:time>%@</ns6:time> \n"
                           "<ns6:tel>%@</ns6:tel> \n"
                           "<ns6:price>%@</ns6:price> \n"
                           "<ns6:username>%@</ns6:username> \n"
                           "</ns6:insertOrder> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",ticketid,filmname,cinemaname,number,seat,time,tel,price,username];
    
    
        NSLog(@"soapMeeage:%@",soapMessage);
   
    NSString *soapLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return soapMessage;
    }];
    
    
    // http://localhost:8080/axis2/services/UserInfo
    
//    //no 2
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/TicketInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        NSLog(@"respone:%@",response);
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:insertOrderResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        NSString *fanuui=[TBXML textForElement:nsreutrn];
        if(block)block(fanuui);
        //开始利用for循环来解析xml
        
//        //        for (int i=0; (nsreutrn->nextSibling) && i<self.lastPageNum ; i++) {
//        
//        //
//        //            TBXMLElement *axadd=[TBXML childElementNamed:@"ax223:add" parentElement:nsreutrn];
//        //            TBXMLElement *axcatalgory=[TBXML nextSiblingNamed:@"ax223:cataglory" searchFromElement:axadd];
//        //            TBXMLElement *axdesc=[TBXML nextSiblingNamed:@"ax223:desc" searchFromElement:axcatalgory];
//        //            TBXMLElement *axname=[TBXML nextSiblingNamed:@"ax223:name" searchFromElement:axdesc];
//        //            TBXMLElement *axneworOld=[TBXML nextSiblingNamed:@"ax223:neworOld" searchFromElement:axname];
//        //            TBXMLElement *axprice=[TBXML nextSiblingNamed:@"ax223:price" searchFromElement:axneworOld];
//        //            TBXMLElement *axrarePrice=[TBXML nextSiblingNamed:@"ax223:rarePrice" searchFromElement:axprice];
//        
//        
//        
//        //            NSDictionary *dict1=@{@"name":[TBXML textForElement:axname],@"price":[TBXML textForElement:axprice],@"neworOlr":[TBXML textForElement:axneworOld],@"desc":[TBXML textForElement:axdesc],@"cataglory":[TBXML textForElement:axcatalgory],@"rarePrice":[TBXML textForElement:axrarePrice]};
//        
//        
//        //            [temppp2 addObject:dict1];
//        //
//        //            nsreutrn=nsreutrn->nextSibling;
//        //
//        
//        //判断接下来有没有了
//        //            if (nil==[TBXML childElementNamed:@"ax223:add" parentElement:nsreutrn]) {
//        //                UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        //                [showNothing show];
//        //                break;
//        //            }
//        
//        // }
//        
//        
//        //
//        //        self.getArr=temppp2;
//        //
//        //
//        //        [self.tableView reloadData];
//        //
//        //
//        //
//        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}

//
//
//
//
//
////END getData

@end
