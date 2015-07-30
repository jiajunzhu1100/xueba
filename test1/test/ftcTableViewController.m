#import "ftcTableViewController.h"
#import "OTPageScrollView.h"
#import "OTPageView.h"
#import "ftcTableViewCell.h"
@interface ftcTableViewController ()

@end

@implementation ftcTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.lastPageNum=6;
    
//    [self setupRefresh];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
     return self.getArr.count;
  // return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    ftcTableViewCell *cell=(ftcTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ftc"];
    
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"ftcTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
    }

    
//    
//    cell.cinemaname.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaname"];
//    cell.address.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaaddress"];
//    cell.grade.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemagrade"];
    

    return cell;
}
//#pragma mark -webservice
////getData
//
//
//
////andName(参数申明):(NSString *)(参数类型)name(参数名称)
//
//
//
//-(void)queryAll:(void(^)(id result))block andJ:(NSString *)j  {
//    
//    
//    
//    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
//    //no 1
//    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
//                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
//                           "<soapenv:Body> \n"
//                           "<ns4:queryAll xmlns:ns4=\"http://hpyd\"> \n"
//                           "<ns4:j>%@</ns4:j> \n"
//                           "</ns4:queryAll> \n"
//                           "</soapenv:Body> \n"
//                           "</soapenv:Envelope>",[NSString stringWithFormat:@"%d",self.lastPageNum]];
//    
//    
//    
//    NSLog(@"soapMeeage:%@",soapMessage);
//    
//    NSString *soapLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    
//    
//    
//    
//    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
//    [manager.requestSerializer setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
//        return soapMessage;
//    }];
//    
//    
//    
//    
//    
//    // http://localhost:8080/axis2/services/UserInfo
//    
//    
//    //no 2
//    
//    [manager POST:@"http://10.211.55.5:8080/axis2/services/HPYD" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
//        //自己测试的关于函数局部变量传递给成员变量的假设 成功
//        NSLog(@"respone:%@",response);
//        
//        
//        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
//        TBXMLElement *root=xml.rootXMLElement;
//        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
//        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:queryAllResponse" parentElement:body];
//        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
//        
//        
//        //开始利用for循环来解析xml
//        
//        for (int i=0; (nsreutrn->nextSibling) && i<self.lastPageNum ; i++) {
//            
//            
//            TBXMLElement *axfilmname=[TBXML childElementNamed:@"ax211:filmname" parentElement:nsreutrn];
//            TBXMLElement *axnum=[TBXML nextSiblingNamed:@"ax211:num" searchFromElement:axfilmname];
//            TBXMLElement *axnum1=[TBXML nextSiblingNamed:@"ax211:num1" searchFromElement:axnum];
//            TBXMLElement *axnum2=[TBXML nextSiblingNamed:@"ax211:num2" searchFromElement:axnum1];
//            TBXMLElement *axnum3=[TBXML nextSiblingNamed:@"ax211:num3" searchFromElement:axnum2];
//            TBXMLElement *axtime=[TBXML nextSiblingNamed:@"ax211:time" searchFromElement:axnum3];
//            TBXMLElement *axtime1=[TBXML nextSiblingNamed:@"ax211:time1" searchFromElement:axtime];
//            TBXMLElement *axtime2=[TBXML nextSiblingNamed:@"ax211:time2" searchFromElement:axtime1];
//            TBXMLElement *axtime3=[TBXML nextSiblingNamed:@"ax211:time3" searchFromElement:axtime2];
//            
//            
//            
//            
//            
//            
//            NSDictionary *dict1=@{@"filmname":[TBXML textForElement:axfilmname],@"num":[TBXML textForElement:axnum],@"num1":[TBXML textForElement:axnum1],@"num2":[TBXML textForElement:axnum2],@"num3":[TBXML textForElement:axnum3],@"time":[TBXML textForElement:axtime],@"time1":[TBXML textForElement:axtime1],@"time2":[TBXML textForElement:axtime2],@"time3":[TBXML textForElement:axtime3]};
//            
//            
//            
//            [temppp2 addObject:dict1];
//            
//            nsreutrn=nsreutrn->nextSibling;
//            
//            
//            //判断接下来有没有了
//            if (nil==[TBXML childElementNamed:@"ax211:filmname" parentElement:nsreutrn]) {
//                //                        UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//                //                      [showNothing show];
//                break;
//            }
//            
//        }
//        
//        
////        
////        self.getArr=temppp2;
////        if(block)block(temppp2);
////        
////        
////        
////        [self.tableView reloadData];
////        
//        
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        
//        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
//        NSLog(@"%@, %@", operation, error);
//        if (block)block(response);
//        
//    }];
//    
//    
//    
//}
#pragma mark -webservice
//getData



//andName(参数申明):(NSString *)(参数类型)name(参数名称)



-(void)querycinemaAll:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns6:queryAll xmlns:ns6=\"http://cinemainfo\"> \n"
                           "<ns6:j>%@</ns6:j> \n"
                           "</ns6:querycinemaAll> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",[NSString stringWithFormat:@"%d",self.lastPageNum]];
    
    
    
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
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/CinemaInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        NSLog(@"respone:%@",response);
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:querycinemaAllResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
        
        
        //开始利用for循环来解析xml
        
        for (int i=0; (nsreutrn->nextSibling) && i<self.lastPageNum ; i++) {
            
            
            TBXMLElement *axaddress=[TBXML childElementNamed:@"ax211:cinemaaddressString" parentElement:nsreutrn];
            TBXMLElement *axgrade=[TBXML nextSiblingNamed:@"ax211:cinemagradeString" searchFromElement:axaddress];
            TBXMLElement *axname=[TBXML nextSiblingNamed:@"ax211:cinemanameString" searchFromElement:axgrade];
            TBXMLElement *axspecial=[TBXML nextSiblingNamed:@"ax211:cinemaspecialString" searchFromElement:axname];
            TBXMLElement *axtel=[TBXML nextSiblingNamed:@"ax211:cinematelString" searchFromElement:axspecial];
            TBXMLElement *axzone=[TBXML nextSiblingNamed:@"ax211:cinemazoneString" searchFromElement:axtel];
           
            
            
            
            
            
            
            NSDictionary *dict=@{@"cinemaaddress":[TBXML textForElement:axaddress],@"cinemagrade":[TBXML textForElement:axgrade],@"cinemaname":[TBXML textForElement:axname],@"cinemaspecial":[TBXML textForElement:axspecial],@"cinematel":[TBXML textForElement:axtel],@"cinemazone":[TBXML textForElement:axzone]};
            
            
            
            [temppp2 addObject:dict];
            
            nsreutrn=nsreutrn->nextSibling;
            
            
            //判断接下来有没有了
            if (nil==[TBXML childElementNamed:@"ax211:cinemaaddressString" parentElement:nsreutrn]) {
                //                        UIAlertView *showNothing=[[UIAlertView alloc]initWithTitle:nil message:@"下面没有了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                //                      [showNothing show];
                break;
            }
            
        }
        
        
        
        self.getArr=temppp2;
        if(block)block(temppp2);
        
        
        
        [self.tableView reloadData];
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"%@, %@", operation, error);
        if (block)block(response);
        
    }];
    
    
    
}
@end
