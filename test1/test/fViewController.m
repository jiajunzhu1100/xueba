//
//  fViewController.m
//  test
//
//  Created by 郭正豪 on 15/6/1.
//  Copyright (c) 2015年 郭正豪. All rights reserved.
//

#import "fViewController.h"
#import "dddViewController.h"
@interface fViewController ()

@end

@implementation fViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        //clear
   
    NSLog(@"123123123xueba:%@ 32123213123",self.shijianget);
   

    //END clear
      
    
//    
//    self.imagarray=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"],nil];
    
    self.scrollview.delegate=self;
    self.seats=[NSMutableArray new];
    //    NSArray *imageArr=@[@"1.jpeg",@"2.jpeg",@"3.jpeg",@"4.jpeg"];
    CGFloat width=self.scrollview.bounds.size.width;
    CGFloat height=self.scrollview.bounds.size.height;
    //    for (NSInteger i=0; i<[imageArr count]; i++) {
    //        UIImage *image=[UIImage imageNamed:imageArr[i]];
    //
    //        UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
    //
    //
    //        [imageView setFrame:CGRectMake(i*width, 0, width, height)];
    //        [self.scrollview addSubview:imageView];
    //    }
    
    [self.scrollview setBounces:NO];
    [self.scrollview setShowsHorizontalScrollIndicator:YES];
    [self.scrollview setContentSize:CGSizeMake(3*width, height)];
    [self.scrollview setPagingEnabled:NO];
    
    for (int i=1; i<8; i++) {
        UIButton *bb=[UIButton buttonWithType:UIButtonTypeCustom];
        bb.frame=CGRectMake(40+i*60, 30, 50, 50);
        [bb setTitle:@"" forState:UIControlStateNormal];
        //[bb setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [bb setImage:[UIImage imageNamed:@"seat.png"] forState:UIControlStateNormal];
        
        //[bb setBackgroundImage:[UIColor grayColor] forState:UIControlStateHighlighted];
        
//        if (bb.enabled==YES) {
//           bb.userInteractionEnabled=NO;
//        }
        
        [bb addTarget:self action:@selector(dropbutton:) forControlEvents:UIControlEventTouchUpInside];
        bb.tag=i;
//        [self.view addSubview:bb];
        
        self.scrollview.backgroundColor=[UIColor grayColor];
        [self.scrollview addSubview:bb];
        for (int j=1; j<7; j++) {
                UIButton *cc=[UIButton buttonWithType:UIButtonTypeCustom];
                cc.frame=CGRectMake(40+i*60, 30+60*j, 50, 50);
                [cc setTitle:@"" forState:UIControlStateNormal];
                //[cc setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [cc setImage:[UIImage imageNamed:@"seat.png"] forState:UIControlStateNormal];
            
            
            //[cc setBackgroundImage:[UIColor grayColor] forState:UIControlStateHighlighted];
//            if (cc.selected==YES) {
//                cc.enabled=NO;
//            }
            [cc addTarget:self action:@selector(dropbutton:) forControlEvents:UIControlEventTouchUpInside];
            cc.tag=j*10+i;
//            [self.view addSubview:cc];
            
                self.scrollview.backgroundColor=[UIColor grayColor];
                [self.scrollview addSubview:cc];
        }
    }
    for (int i=1; i<8; i++) {
        UILabel *ll=[UILabel new];
        ll.frame=CGRectMake(55+i*60, 10, 20, 20);
        NSString *hh=[NSString stringWithFormat:@"%d",i];
        [ll setText:hh];
        [ll setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:24]];
        [ll setTextColor:[UIColor whiteColor]];
        
         [self.scrollview addSubview:ll];
         }
    for (int i=1; i<8; i++) {
        UILabel *aa=[UILabel new];
        aa.frame=CGRectMake(60, -10+i*60, 20, 20);
        NSString *yy=[NSString stringWithFormat:@"%d",i];
        [aa setText:yy];
        [aa setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:18]];
        [aa setTextColor:[UIColor whiteColor]];
        [self.scrollview addSubview:aa];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [self.seats removeAllObjects];
    
    

    
    
}

-(void)dropbutton:(UIButton*)button {
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    NSString *pai1=[NSString new];
    
    
    

    pai1=[NSString stringWithFormat:@"%ld排%ld列",(button.tag/10)+1,button.tag%10];
    
    NSLog(@"必胜！%@",pai1);
    
    [self.seats addObject:pai1];
    
    if ((button.selected=YES)) {
        button.enabled=NO;
        [button setBackgroundColor:[UIColor blackColor]];
        //[button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }else{
        //[button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
}
//    if (self.seats.count > 5)
//    {
//        
//        self.err2=[[UIAlertView alloc]initWithTitle:nil message:@"最多选择5个座位" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
//        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];        [self.err2 show];
//    }

//    int x;
//    if ((button.selected=[UIColor greenColor])) {
//        int x=2;
//    }else{
//        int x=1;
//    }
//    
//   
//    NSLog(@"-------------%d",x);
//        switch (x) {
//            case 1:
//                [self.seats addObject:pai1];
//                [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//                break;
//                
//            default:
//                [self.seats removeObject:pai1];
//                [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//                break;
//        }
//    NSLog(@"%@",self.seats);
//    button.selected=YES;
//         button.enabled=NO;
//        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
        
     


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];
    UITouch *touch=[allTouches anyObject];
    CGPoint point=[touch locationInView:[touch view]];
    int x=point.x;
    int y=point.y;
    NSLog(@"touch (x,y) is (%d,%d)",x,y);

//    switch (bb.tag) {
//        case 1:
//            pai=@"1";
//        
//            break;
//            
//        @selector(touchesBegan:withEvent:)
//    }
//    switch (y) {
//        case 1:
//            lie=@"1";
//        
//            
//        
//            break;
//    }NSLog(@"%@",pai);
//    NSLog(@"%@",lie);
}
////-(void)bc{
//    UIAlertView *doit=[[UIAlertView alloc]initWithTitle:nil message:@"hello" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
//    
//    [doit show];
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)confirm:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    dddViewController *dViewController = [storyboard instantiateViewControllerWithIdentifier:@"ddd"];
    dViewController.cinemaget=self.cinemanameget;
    dViewController.seatget=self.seats;
    dViewController.timeget=self.shijianget;
//    NSLog(@"222222----pai:%@ ----------",[NSString stringWithFormat:@"%@",self.seats]);
    for (int i=0; i<self.seats.count; i++) {
        
        NSLog(@"ss%@ss",[self.seats objectAtIndex:i]);
    }
    if (self.seats.count==0) {
        self.err1=[[UIAlertView alloc]initWithTitle:nil message:@"请选择座位" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [self.err1 show];
    }else     {
    [self.navigationController pushViewController:dViewController animated:YES];
    }
   
    
}
-(void)performDismiss:(NSTimer*)timer

{
    
    [self.err1 dismissWithClickedButtonIndex:0 animated:NO];
    
}
- (IBAction)cancel:(id)sender {
    UIAlertView *err=[[UIAlertView alloc]initWithTitle:nil message:@"确定取消吗？" delegate:self cancelButtonTitle:@"手滑了" otherButtonTitles:@"确定",nil];
    
    [err show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)otherbuttonIndex{
    
    NSLog(@" button index=%ld is clicked.....", (long)otherbuttonIndex);
    if (otherbuttonIndex==1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

@end
