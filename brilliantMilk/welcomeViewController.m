//
//  welcomeViewController.m
//  brilliantMilk
//
//  Created by MBZL on 15/12/17.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "welcomeViewController.h"
#import "tabBarViewController.h"
#define winW [[UIScreen mainScreen] bounds].size.width
#define winH     [[UIScreen mainScreen] bounds].size.height

@interface welcomeViewController ()
@property UIScrollView* scrollview;
@property UIPageControl* pageControl;


@end

@implementation welcomeViewController
-(NSArray*)welcomeImage{
    return @[@"update01.jpg",@"update02.jpg",@"update03.jpg",@"update04.jpg",@"update05.jpg"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f,%f",winW,winH);
    self.view.frame=[[UIScreen mainScreen]bounds];
    self.scrollview=[[UIScrollView alloc]initWithFrame:self.view.frame];
    for (NSInteger index=0; index<self.welcomeImage.count; index++) {
        UIImage* image=[UIImage  imageNamed:self.welcomeImage[index]];
        UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
        imageView.frame=CGRectMake(self.view.frame.size.width*index, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.scrollview  addSubview:imageView];
    }
    self.scrollview.contentSize=CGSizeMake(self.view.frame.size.width*self.welcomeImage.count, self.view.frame.size.height);
    [self.view addSubview:self.scrollview];
    self.scrollview.bounces=NO;
    self.scrollview.pagingEnabled=YES;
    
    self.scrollview.showsHorizontalScrollIndicator=NO;
    
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width,40)];
    
    UIButton * jump=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*(self.welcomeImage.count-1) , 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    //    self.pageControl.backgroundColor=[UIColor grayColor];
    self.pageControl.numberOfPages=self.welcomeImage.count;
    self.pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    self.pageControl.enabled=NO;
    self.scrollview.delegate=self;
    [self.scrollview addSubview:jump];
    [jump addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pageControl];
    // Do any additional setup after loading the view from its nib.
}
- (void)jump:(UIButton *)sender {
    tabBarViewController * tabBarView=[[tabBarViewController alloc]initWithNibName:@"tabBarViewController" bundle:nil];
//    UINavigationController * navigationControlller=[[UINavigationController alloc]initWithRootViewController:tabBarView];
    [self presentViewController:tabBarView animated:NO completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    NSLog(@"调用了这个方法");
}

-(void)viewDidDisappear:(BOOL)animated{

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = scrollView.contentOffset.x /self.view.frame.size.width;
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
