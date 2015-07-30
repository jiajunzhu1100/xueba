#import "movietimeTableViewController.h"
#import "ftc2TableViewCell.h"
#import "fViewController.h"
#import "testTableViewController.h"
//#import "cell1TableViewCell.h"
//#import "TableViewCell.h"

@interface movietimeTableViewController ()

@end

@implementation movietimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self querycinemaAll:^(id res){} andJ:@"5"];
    
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(ObjectInfo:) name:@"turn" object:nil];
    
    self.cui=0;
    self.cuicui=0;
    
}
-(void)ObjectInfo:(NSNotification*) notification{
    //info dict
    NSDictionary *transback=[notification userInfo];
    NSString *getTag=[transback objectForKey:@"tag"];
    NSString *tag2time=[NSString new];
    //END info dict
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    fViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"f"];
    NSLog(@"indexpath:%ld====",self.path.row);
    filmDetailViewController.cinemanameget=[[self.getArr objectAtIndex:self.path.row] objectForKey:@"cinemaname"];
    [self.navigationController pushViewController:filmDetailViewController animated:YES];
    
    
    switch ([getTag integerValue]) {
        case 1:
            tag2time=@"10:00";
            break;
        case 2:
            tag2time=@"12:30";
            break;
        case 3:
            tag2time=@"15:30";
            break;
        default:
            tag2time=@"19:00";
            break;
    }
    
    filmDetailViewController.shijianget=tag2time;


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
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    //end
    
    
    
    ftc2TableViewCell *cell=(ftc2TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ftc2"];
    
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"ftc2TableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
    }
    
  
    // Configure the cell...
    cell.scroll.delegate=self;
    CGFloat width=cell.scroll.bounds.size.width;
    CGFloat height=cell.scroll.bounds.size.height;
    
    [cell.scroll setBounces:NO];
    [cell.scroll setShowsHorizontalScrollIndicator:YES];
    [cell.scroll setContentSize:CGSizeMake(5*width, height)];
    [cell.scroll setPagingEnabled:YES];
    
    
    
    
    
    UIButton *bb1=[UIButton buttonWithType:UIButtonTypeCustom];
    bb1.frame=CGRectMake(10, 20, 50, 50);
    [bb1 setTitle:@"10:00" forState:UIControlStateNormal];
    [bb1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb1 addTarget:cell action:@selector(turn:) forControlEvents:UIControlEventTouchUpInside];
    bb1.tag=1;
    self.time=[bb1 currentTitle];
    
    
    

    cell.scroll.backgroundColor=[UIColor whiteColor];
    [cell.scroll addSubview:bb1];
    
    UIButton *bb2=[UIButton buttonWithType:UIButtonTypeCustom];
    bb2.frame=CGRectMake(130, 20, 50, 50);
    [bb2 setTitle:@"12:30" forState:UIControlStateNormal];
    [bb2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb2 addTarget:cell action:@selector(turn:) forControlEvents:UIControlEventTouchUpInside];
    bb2.tag=2;
    cell.scroll.backgroundColor=[UIColor whiteColor];
    [cell.scroll addSubview:bb2];
    
    
    UIButton *bb3=[UIButton buttonWithType:UIButtonTypeCustom];
    bb3.frame=CGRectMake(250, 20, 50, 50);
    [bb3 setTitle:@"15:30" forState:UIControlStateNormal];
    [bb3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb3 addTarget:cell action:@selector(turn:) forControlEvents:UIControlEventTouchUpInside];
    bb3.tag=3;
    cell.scroll.backgroundColor=[UIColor whiteColor];
    [cell.scroll addSubview:bb3];
    
    
    UIButton *bb4=[UIButton buttonWithType:UIButtonTypeCustom];
    bb4.frame=CGRectMake(370, 20, 50, 50);
    [bb4 setTitle:@"19:00" forState:UIControlStateNormal];
    [bb4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bb4 addTarget:cell action:@selector(turn:) forControlEvents:UIControlEventTouchUpInside];
    bb4.tag=4;
    cell.scroll.backgroundColor=[UIColor whiteColor];
    [cell.scroll addSubview:bb4];
   
 


    

    // Configure the cell...
        cell.cinemaname.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaname"];
        cell.address.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemaaddress"];
        cell.grade.text=[[self.getArr objectAtIndex:indexPath.row] objectForKey:@"cinemagrade"];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
//    
//    fViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"f"];
//    //
//    movietimeTableViewController *f4dv=[storyboard instantiateViewControllerWithIdentifier:@"f4"];
//    
//    
//    [self.navigationController pushViewController:filmDetailViewController animated:YES];
    
    
    self.path=indexPath;
               
}


//-(void)bc {
    
    
//    NSLog(@"ininin bc");
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
//    
//    fViewController *filmDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"f"];
//    
//    [self presentViewController:filmDetailViewController animated:YES completion:nil];
    
     
//}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

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
#pragma mark -webservice
//getData



//andName(参数申明):(NSString *)(参数类型)name(参数名称)



-(void)querycinemaAll:(void(^)(id result))block andJ:(NSString *)j  {
    
    
    
    NSMutableArray *temppp2=[[NSMutableArray alloc]init];
    //no 1
    NSString *soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                           "<soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                           "<soapenv:Body> \n"
                           "<ns6:querycinemaAll xmlns:ns6=\"http://cinemainfo\"> \n"
                           "<ns6:j>%@</ns6:j> \n"
                           "</ns6:querycinemaAll> \n"
                           "</soapenv:Body> \n"
                           "</soapenv:Envelope>",j];
    
    
    
    NSLog(@"soapMeeage11111111111:%@",soapMessage);
    
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
        
        for (int i=0; (nsreutrn->nextSibling) && i<[j integerValue]; i++) {
            
            
            TBXMLElement *axaddress=[TBXML childElementNamed:@"ax21:cinemaaddressString" parentElement:nsreutrn];
            TBXMLElement *axgrade=[TBXML nextSiblingNamed:@"ax21:cinemagradeString" searchFromElement:axaddress];
            TBXMLElement *axname=[TBXML nextSiblingNamed:@"ax21:cinemanameString" searchFromElement:axgrade];
            TBXMLElement *axspecial=[TBXML nextSiblingNamed:@"ax21:cinemaspecialString" searchFromElement:axname];
            TBXMLElement *axtel=[TBXML nextSiblingNamed:@"ax21:cinematelString" searchFromElement:axspecial];
            TBXMLElement *axzone=[TBXML nextSiblingNamed:@"ax21:cinemazoneString" searchFromElement:axtel];
            
            
            
            
            
            
            
            NSDictionary *dict=@{@"cinemaaddress":[TBXML textForElement:axaddress],@"cinemagrade":[TBXML textForElement:axgrade],@"cinemaname":[TBXML textForElement:axname],@"cinemaspecial":[TBXML textForElement:axspecial],@"cinematel":[TBXML textForElement:axtel],@"cinemazone":[TBXML textForElement:axzone]};
            
            
            
            [temppp2 addObject:dict];
            
            nsreutrn=nsreutrn->nextSibling;
            
            
            //判断接下来有没有了
            if (nil==[TBXML childElementNamed:@"ax21:cinemaaddressString" parentElement:nsreutrn]) {
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

- (IBAction)cancel:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
//    testTableViewController *testViewController = [storyboard instantiateViewControllerWithIdentifier:@"test"];
    [self.navigationController popToRootViewControllerAnimated:YES];
     }
@end
