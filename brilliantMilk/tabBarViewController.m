//
//  tabBarViewController.m
//  brilliantMilk
//
//  Created by MBZL on 15/12/17.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "tabBarViewController.h"
#import "frontPageTableViewController.h"
#import "goodsTableViewController.h"
#import "shopingTableViewController.h"
#import "myTableViewController.h"
#import "loginViewController.h"
#define winW [[UIScreen mainScreen] bounds].size.width
#define winH     [[UIScreen mainScreen] bounds].size.height
@interface tabBarViewController ()
{
    UIImageView * _selectImage;

}
@end

@implementation tabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBottom];
    [self setViewControllers:[self allView]];
    [self creatView];
    [self addGesture];

    self.delegate=self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden=YES;
    }


    return self;
}
-(void)creatBottom{
    
    UIImageView * tabBarBackgroundImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, winH-50, winW, 50)];
    tabBarBackgroundImage.image=[UIImage imageNamed:@"tabBar.jpg"];
    [self.view addSubview:tabBarBackgroundImage];
        UIButton * frontButton=[[UIButton alloc]initWithFrame:CGRectMake(winW/8-10, winH-42, 40, 40)];
    frontButton.tag=0;
    frontButton.backgroundColor=[UIColor blackColor];
    [frontButton setImage:[UIImage imageNamed:[[self allBarItemImage] objectAtIndex:frontButton.tag]] forState:UIControlStateNormal];
    UIButton *  goodsButton=[[UIButton alloc]initWithFrame:CGRectMake(3*winW/8-10, winH-42, 40, 40)];
    goodsButton.tag=1;
    goodsButton.backgroundColor=[UIColor blackColor];
    [goodsButton setImage:[UIImage imageNamed:[[self allBarItemImage] objectAtIndex:goodsButton.tag]] forState:UIControlStateNormal];
    UIButton * shopingButton=[[UIButton alloc]initWithFrame:CGRectMake(5*winW/8-10, winH-42, 40, 40)];
    shopingButton.tag=2;
    shopingButton.backgroundColor=[UIColor blackColor];
    [shopingButton setImage:[UIImage imageNamed:[[self allBarItemImage]objectAtIndex:shopingButton.tag]] forState:UIControlStateNormal];
    UIButton * myButton=[[UIButton alloc]initWithFrame:CGRectMake(7*winW/8-10, winH-42, 40, 40)];
    myButton.tag=3;
    myButton.backgroundColor=[UIColor blackColor];
    [myButton setImage:[UIImage imageNamed:[[self allBarItemImage] objectAtIndex:myButton.tag]] forState:UIControlStateNormal];
    [self.view addSubview:frontButton];
    [self.view addSubview:goodsButton];
    [self.view addSubview:shopingButton];
    [self.view addSubview:myButton];
    [frontButton addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    [goodsButton addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    [shopingButton addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    [myButton addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    _selectImage=[[UIImageView alloc] initWithFrame:CGRectMake(winW/8-10, winH-42, 40, 40)];
    _selectImage.image=[UIImage imageNamed:@"barSelected.png"];
    [self.view addSubview:_selectImage];
//    _viewControlerLabel=[[UILabel alloc]initWithFrame:CGRectMake(winW/2-60, 5, 120, 50)];
//    _viewControlerLabel.textAlignment=1;
//    [_viewControlerLabel setFont:[UIFont fontWithName:@"Libian SC"size:25]];
//    _viewControlerLabel.textColor=[UIColor whiteColor];
//    [self.view addSubview:_viewControlerLabel];

   

}
-(void)changeView:(UIButton*)selectedbutton{
    self.selectedIndex=selectedbutton.tag;
    [UIView beginAnimations:nil context:nil];
    _selectImage.frame=CGRectMake((self.selectedIndex*2+1)*winW/8-10, winH-42, 40, 40);
    [UIView commitAnimations];
    self.viewControlerLabel.text=self.selectedViewController.title;



}
-(NSArray*)allView{
    frontPageTableViewController * front=[[frontPageTableViewController alloc]initWithNibName:@"frontPageTableViewController" bundle:nil];

    goodsTableViewController * goods=[[goodsTableViewController alloc]initWithNibName:@"goodsTableViewController" bundle:nil];

    shopingTableViewController* shoping=[[shopingTableViewController alloc]initWithNibName:@"shopingTableViewController" bundle:nil];
    myTableViewController* my=[[myTableViewController alloc]initWithNibName:@"myTableViewController" bundle:nil];
//    UINavigationController * frontNavigation=[[UINavigationController alloc]initWithRootViewController:front];
//    UINavigationController * goodsNavigation=[[UINavigationController alloc]initWithRootViewController:goods];
//    UINavigationController * shopingNavigation=[[UINavigationController alloc]initWithRootViewController:shoping];
//
//    UINavigationController * myNavigation=[[UINavigationController alloc]initWithRootViewController:my];
    NSArray* allView=@[front,goods,shoping,my];
//    NSArray * allView=@[frontNavigation,goodsNavigation,shopingNavigation,myNavigation];
    return allView;

}
-(void)goToSearch:(UIButton*)button{
    loginViewController * login=[[loginViewController alloc]initWithNibName:@"loginViewController" bundle:nil];
}

-(NSArray*)allBarItemImage{
    


    return @[@"front.jpg",@"goods.jpg",@"shoping.jpg",@"my.jpg"];}
-(void)creatView{
//    UIImageView * navigationBarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,winW,42)];
//    UIImage * barBackgroundimage=[UIImage imageNamed:@"navigationBar.jpg"];
//    navigationBarImageView.image=barBackgroundimage;
//    [self.view addSubview:navigationBarImageView];
    UIToolbar * toolbal=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, winW, 50)];
    [toolbal setBackgroundImage:[UIImage imageNamed:@"navigationBar.jpg"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.view addSubview:toolbal];
    UIButton * search=[[UIButton alloc]initWithFrame:CGRectMake(winW-40,15, 40, 40)];
    [search addTarget:self action:@selector(goToSearch:) forControlEvents:UIControlEventTouchUpInside];

    [search setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [self.view addSubview:search];
    UIButton* login=[[UIButton alloc]initWithFrame:CGRectMake(20, 15, 40, 40)];
    [login setTitle:@"登录" forState:UIControlStateNormal];

    login.titleLabel.font=[UIFont fontWithName:@"Libian SC" size:20];
    [self.view addSubview:login];
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(winW/2-70, 15, 140, 30)];
    
    label.text=self.selectedViewController.title;
    label.textColor=[UIColor whiteColor];
    label.textAlignment=1;
    label.font=[UIFont fontWithName:@"Libian SC" size:25];
    [self.view addSubview:label];
    self.viewControlerLabel=label;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{


    self.viewControlerLabel.text=viewController.title;

}


-(void)viewWillAppear:(BOOL)animated{

}
-(void)addGesture{
    UISwipeGestureRecognizer* swip;
    swip=[[UISwipeGestureRecognizer  alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swip];
    swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
}
-(void)swipFrom:(UISwipeGestureRecognizer*)gestuerRecognizer
{
        if (gestuerRecognizer.direction==UISwipeGestureRecognizerDirectionRight) {
            self.selectedIndex++;
        }
        else if (gestuerRecognizer.direction==UISwipeGestureRecognizerDirectionLeft){
            self.selectedIndex--;
        }
    [UIView beginAnimations:nil context:nil];
    _selectImage.frame=CGRectMake((self.selectedIndex*2+1)*winW/8-10, winH-42, 40, 40);
    [UIView commitAnimations];
    self.viewControlerLabel.text=self.selectedViewController.title;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
