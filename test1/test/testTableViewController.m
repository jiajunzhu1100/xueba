#import "testTableViewController.h"
#import "TableViewCell.h"
#import "cccViewController.h"
@interface testTableViewController ()

@end

@implementation testTableViewController
{
    NSArray *pageTitles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.lastPageNum=6;
   
    [self setupRefresh];
    
    
    self.navigationController.navigationBar.barTintColor=[UIColor orangeColor];
      }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewWillAppear:(BOOL)animated{
//    [self queryAll:^(id res){ } andJ:@"2"];
//}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.getArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    TableViewCell *cell=(TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    
    }
    
    
    
    //
    //    if (true) {
    //        UINib *nib=[UINib nibWithNibName:@"CellTable" bundle:nil];
    //        [tableView registerNib:nib forCellReuseIdentifier:cellName];
    //    }
    //
    //
    //    CellTable *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
//    [self queryAll:^(id res){cell.name.text=[[(NSArray *)res objectAtIndex:0] objectForKey:@"nameString"];} andJ:@"2"];
    cell.name.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmnameString"];
    cell.actor.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"actorString"];
    cell.star.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmgradeString"];
    cell.jianjie.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"introductionString"];
    
   // NSString *yurl=@"http://10.211.55.5:8087/fulian.jpg";
    
    [self queryImage:^(id res){[cell.image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.211.55.5:8087/%@.jpg",res]] placeholderImage:[UIImage imageNamed:@"fulian.jpg"] ];  } andJ:[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmnameString"]];
    
    
    
    //[cell.image setImageWithURL:[NSURL URLWithString:yurl] placeholderImage:[UIImage imageNamed:@"fulian.jpg"]];
    
    // Configure the cell...
    
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    cccViewController *xcc=segue.destinationViewController;
    xcc.nameget=self.nameget;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    cccViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"ccc"];
    
    [self.navigationController pushViewController:filmDetailViewController animated:YES];
    
    
    filmDetailViewController.nameget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmnameString"];
    filmDetailViewController.actorget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"actorString"];
    filmDetailViewController.daoyanget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"directorString"];
    filmDetailViewController.jianjieget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"introductionString"];
    filmDetailViewController.timeget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmtimeString"];
    filmDetailViewController.typeget=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"filmtypeString"];
    
//    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"1",@"2",nil];
//    
//    //初始化UISegmentedControl
//    
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
//    
//    segmentedControl.frame = CGRectMake(20, 20, 250, 50);
//    
//    segmentedControl.selectedSegmentIndex = 2;//设置默认选择项索引
//    
//    segmentedControl.tintColor = [UIColor redColor];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
//    
}
#pragma mark -webservice
//getData



//andName(参数申明):(NSString *)(参数类型)name(参数名称)



-(void)queryAll:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns4:queryAll xmlns:ns4=\"http://filminfo\"> \n"
                           "<ns4:j>%@</ns4:j> \n"
                           "</ns4:queryAll> \n"
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
    
    [manager POST:@"http://10.211.55.5:8080/axis2/services/FilmInfo" parameters:soapMessage success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        //自己测试的关于函数局部变量传递给成员变量的假设 成功
        NSLog(@"respone:%@",response);
        
        
        TBXML *xml=[[TBXML alloc]initWithXMLString:response error:nil];
        TBXMLElement *root=xml.rootXMLElement;
        TBXMLElement *body=[TBXML childElementNamed:@"soapenv:Body" parentElement:root];
        TBXMLElement *xmlns=[TBXML childElementNamed:@"ns:queryAllResponse" parentElement:body];
        TBXMLElement *nsreutrn=[TBXML childElementNamed:@"ns:return" parentElement:xmlns];
       
        
        //开始利用for循环来解析xml
        
                for (int i=0; (nsreutrn->nextSibling) && i<self.lastPageNum ; i++) {
        
        
                    TBXMLElement *axactor=[TBXML childElementNamed:@"ax23:actorString" parentElement:nsreutrn];
                    TBXMLElement *axdirector=[TBXML nextSiblingNamed:@"ax23:directorString" searchFromElement:axactor];
                    TBXMLElement *axfilmgrade=[TBXML nextSiblingNamed:@"ax23:filmgradeString" searchFromElement:axdirector];
                    TBXMLElement *axfilmname=[TBXML nextSiblingNamed:@"ax23:filmnameString" searchFromElement:axfilmgrade];
                    TBXMLElement *axfilmtime=[TBXML nextSiblingNamed:@"ax23:filmtimeString" searchFromElement:axfilmname];
                    TBXMLElement *axfilmtype=[TBXML nextSiblingNamed:@"ax23:filmtypeString" searchFromElement:axfilmtime];
                    TBXMLElement *axintroduction=[TBXML nextSiblingNamed:@"ax23:introductionString" searchFromElement:axfilmtype];
                    TBXMLElement *axonoff=[TBXML nextSiblingNamed:@"ax23:onoffString" searchFromElement:axintroduction];
                    TBXMLElement *axshowtime=[TBXML nextSiblingNamed:@"ax23:showtimeString" searchFromElement:axonoff];
                    
                    

        
        
        
                    NSDictionary *dict1=@{@"actorString":[TBXML textForElement:axactor],@"directorString":[TBXML textForElement:axdirector],@"filmgradeString":[TBXML textForElement:axfilmgrade],@"filmnameString":[TBXML textForElement:axfilmname],@"filmtimeString":[TBXML textForElement:axfilmtime],@"filmtypeString":[TBXML textForElement:axfilmtype],@"introductionString":[TBXML textForElement:axintroduction],@"onoffString":[TBXML textForElement:axonoff],@"showtimeString":[TBXML textForElement:axshowtime]};
                    
        
        
                    [temppp2 addObject:dict1];
        
                    nsreutrn=nsreutrn->nextSibling;
        
        
                    //判断接下来有没有了
                    if (nil==[TBXML childElementNamed:@"ax23:actorString" parentElement:nsreutrn]) {
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
    
    NSLog(@"------------%@",soapLength);
    
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





//END getData
- (void)setupRefresh
{
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    [self.tableView headerBeginRefreshing];
    
    
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    
    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    self.tableView.headerRefreshingText = @"正在帮你刷新中,不客气";
    
    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    self.tableView.footerRefreshingText = @"正在帮你加载中,不客气";
}



#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [self.getArr removeAllObjects];
    
    
    
    
    [self queryAll:^(id res){ } andJ:@"2"];
    [self.tableView headerEndRefreshing];
    
    
    
}

- (void)footerRereshing
{
    self.lastPageNum +=1;
    
    [self queryAll:^(id res){ } andJ:@"2"];
    [self.tableView footerEndRefreshing];
    
    
}




//刷新插件END
@end



