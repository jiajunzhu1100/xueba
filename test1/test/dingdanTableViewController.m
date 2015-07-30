//
//  dingdanTableViewController.m
//  test
//
//  Created by 郭正豪 on 15/4/13.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "dingdanTableViewController.h"
#import "cell1TableViewCell.h"
#import "dingdandetailViewController.h"
#import "TBXML.h"
#import "AFNetworking.h"
@interface dingdanTableViewController ()

@end

@implementation dingdanTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self queryorderAll:^(id res){} andJ:@"10"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return self.getArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    static NSString *cellName=@"cell";
    //    tableView.rowHeight=78;
    
    
    //动态输入
//    NSArray *testArray=[NSArray arrayWithObjects:@"jiehun.jpg",@"fastseven.jpg",@"tegong.jpg",@"zhanlang.jpg",nil];
//    NSArray *name1=[NSArray arrayWithObjects:@"咱们结婚吧",@"速度与激情7",@"王牌特工",@"战狼",nil];
//    NSArray *number=[NSArray arrayWithObjects:@"2",@"1",@"2",@"3", nil];
//    NSArray *zt=[NSArray arrayWithObjects:@"已出票",@"已出票",@"已出票",@"已出票",nil];
//    NSArray *price=[NSArray arrayWithObjects:@"100",@"150",@"200",@"135", nil];
    //end
    
    
    
    cell1TableViewCell *cell1=(cell1TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if(cell1==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"cell1TableViewCell" owner:self options:nil];
        cell1=[nib objectAtIndex:0];
        
    }
    
    cell1.name1.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaname"];
    cell1.number.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"number"];
    cell1.zt.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"price"];
    cell1.filmname.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmname"];
//    [self queryImage:^(id res){[cell1.image2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res]] placeholderImage:[UIImage imageNamed:@"fulian.jpg"] ];  } andJ:[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmname"]];
    [self queryImage:^(id res){[cell1.image2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res]] placeholderImage:[UIImage imageNamed:@"fulian.jpg"]];} andJ:[[self.getArr objectAtIndex:indexPath.row]objectForKey:@"filmname"]];
    // Configure the cell...
   
    return cell1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    dingdandetailViewController *dingdanDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"dingdan"];
    
    
    //    filmDetailViewController.preTag = btn.tag;
    //    filmDetailViewController.preState = stateButtonTag;
    [self.navigationController pushViewController:dingdanDetailViewController animated:YES];
    dingdanDetailViewController.ticketidget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"ticketid"];
    dingdanDetailViewController.filmnameget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmname"];
    dingdanDetailViewController.cinemanameget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaname"];
    dingdanDetailViewController.numberget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"number"];
    dingdanDetailViewController.seatget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"seat"];
    dingdanDetailViewController.timeget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"time"];
    dingdanDetailViewController.priceget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"price"];
    
}
-(void)queryorderAll:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns6:queryorderAll xmlns:ns6=\"http://ticketinfo\"> \n"
                           "<ns6:j>%@</ns6:j> \n"
                           "</ns6:queryorderAll> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",j];
    
    
    
    
    
    NSString *soapLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    
    
    
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return soapMessage;
    }];
    
    
    
    
    
    // http://localhost:8080/axis2/services/UserInfo
    
    
    //no 2
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/TicketInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:queryorderAllResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        
        
        //开始利用for循环来解析xml
        
        for (int i=0; (nsreutrn->nextSibling) && i<[j intValue] ; i++) {
            
            
            TBXMLElement *axcinemaname=[TBXML childElementNamed:@"ax215:cinemaname" parentElement:nsreutrn];
            TBXMLElement *axfilmname=[TBXML nextSiblingNamed:@"ax215:filmname" searchFromElement:axcinemaname];
            TBXMLElement *axnumber=[TBXML nextSiblingNamed:@"ax215:number" searchFromElement:axfilmname];
            TBXMLElement *axprice=[TBXML nextSiblingNamed:@"ax215:price" searchFromElement:axnumber];
            TBXMLElement *axseat=[TBXML nextSiblingNamed:@"ax215:seat" searchFromElement:axprice];
            TBXMLElement *axtel=[TBXML nextSiblingNamed:@"ax215:tel" searchFromElement:axseat];
            TBXMLElement *axticketid=[TBXML nextSiblingNamed:@"ax215:ticketid" searchFromElement:axtel];
            TBXMLElement *axtime=[TBXML nextSiblingNamed:@"ax215:time" searchFromElement:axticketid];
            TBXMLElement *axusername=[TBXML nextSiblingNamed:@"ax215:username" searchFromElement:axtime];
            
            
            
            
            
            
            NSDictionary *dict1=@{@"cinemaname":[TBXML textForElement:axcinemaname],@"filmname":[TBXML textForElement:axfilmname],@"number":[TBXML textForElement:axnumber],@"price":[TBXML textForElement:axprice],@"seat":[TBXML textForElement:axseat],@"tel":[TBXML textForElement:axtel],@"ticketid":[TBXML textForElement:axticketid],@"time":[TBXML textForElement:axtime],@"username":[TBXML textForElement:axusername]};
            
            
            
            [temppp2 addObject:dict1];
            
            nsreutrn=nsreutrn->nextSibling;
            
            
            //判断接下来有没有了
            if (nil==[TBXML childElementNamed:@"ax215:cinemaname" parentElement:nsreutrn]) {
                //                        UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                //                      [showNothing show];
                break;
            }
            
        }
        
        
        
        self.getArr=temppp2;
        NSLog(@"result is = %@ ",temppp2);
        if(block)block(temppp2);
        
        
        
        [self.tableView reloadData];
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}
//image
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

//end

@end

