//
//  ViewController.m
//  brilliantMilk
//
//  Created by MBZL on 15/12/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "ViewController.h"
#import "welcomeViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(poptoCheckView:) userInfo:nil repeats:NO];
    // Do any additional setup after loading the view from its nib.
}
-(void)poptoCheckView:(NSTimer*)timer{
    welcomeViewController * welcomeView=[[welcomeViewController alloc]initWithNibName:@"welcomeViewController" bundle:nil];
    [self presentViewController:welcomeView animated:NO completion:nil];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToNextView:(UIButton *)sender {
    welcomeViewController * welcomeView=[[welcomeViewController alloc]initWithNibName:@"welcomeViewController" bundle:nil];
    [self presentViewController:welcomeView animated:NO completion:nil];
    

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
