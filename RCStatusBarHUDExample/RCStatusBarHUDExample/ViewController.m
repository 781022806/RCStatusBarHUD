//
//  ViewController.m
//  RCStatusBarHUDExample
//
//  Created by ruchu on 2016/12/21.
//  Copyright © 2016年 churu. All rights reserved.
//

#import "ViewController.h"

#import "RCStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1234
}


- (IBAction)success {
    [RCStatusBarHUD showSuccessWithMsg:@"加载成功"];
}
- (IBAction)error {
    [RCStatusBarHUD showErrorWithMsg:@"加载失败"];
}
- (IBAction)load {
    [RCStatusBarHUD showLoadingWithMsg:@"正在加载中..."];
}
- (IBAction)normal {
    [RCStatusBarHUD showWithMsg:@"我没什么事儿" image:[UIImage imageNamed:@"xiong"]];
}
- (IBAction)hide {
    [RCStatusBarHUD dismiss];
}

@end
