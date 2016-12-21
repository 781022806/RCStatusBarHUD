//
//  RCStatusBarHUD.m
//  04-RCStatusBarHUD
//
//  Created by ruchu on 2016/12/19.
//  Copyright © 2016年 churu. All rights reserved.
//

#import "RCStatusBarHUD.h"

static UIWindow *window_;
static NSTimer *timer_;

/** window显示/消失的时间 */
#define RCDismissDuration  2.0
/** 窗口动画时间 */
#define RCAnimationDuration  0.25
/** 提示文字的字体 */
#define RCFont [UIFont systemFontOfSize:14.0]

@implementation RCStatusBarHUD


/**
 显示成功和成功的提示文字
 @param msg 成功的提示文字
 */
+(void)showSuccessWithMsg:(NSString *)msg
{
    
    //初始化window
    [self setupWindow];
    
    //设置显示
    [self showWithImage:[UIImage imageNamed:@"RCStatusBarHUD.bundle/check"] Msg:msg];
    
    
}

/**
 显示失败和失败的提示文字
 @param msg 失败的提示文字
 */
+(void)showErrorWithMsg:(NSString *)msg
{

    //初始化window
    [self setupWindow];
    
    //设置显示
    [self showWithImage:[UIImage imageNamed:@"RCStatusBarHUD.bundle/error"] Msg:msg];
    
}
/**
 显示加载中和提示文字
 @param msg 加载中的提示文字
 */
+(void)showLoadingWithMsg:(NSString *)msg
{
    //停止计时器
    [timer_ invalidate];
    timer_ = nil;
    
    //初始化window
    [self setupWindow];
    
    //创建label
    UILabel *label = [[UILabel alloc]init];
    label.frame = window_.bounds;
    label.text = msg;
    label.font = RCFont;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    //转圈指示器
    //文字宽度
    CGFloat textW = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]}].width;
    CGFloat centerX = (window_.bounds.size.width - textW) * 0.5 - 20;
    CGFloat centerY = 10;
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]init];
    indicator.center = CGPointMake(centerX, centerY);
    [indicator startAnimating];
    [window_ addSubview:indicator];
    
}
/**
 普通提示
 @param msg 提示文字
 */
+(void)showWithMsg:(NSString *)msg
{
    //初始化window
    [self setupWindow];
    
    //设置显示
    [self showWithImage:nil Msg:msg];
}

/**
 带图片的普通提示
 @param msg 提示文字
 @param image 提示图片
 */
+(void)showWithMsg:(NSString *)msg image:(UIImage *)image
{
    [self showWithImage:image Msg:msg];
}


/**
 隐藏控制器
 */
+(void)dismiss
{
    //动画
    CGRect frame = window_.frame;
    frame.origin.y = -20;
    [UIView animateWithDuration:RCAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        //消失
        window_ = nil;
        timer_ = nil;
    }];
}


#pragma mark - 其他方法
/**
 初始化window
 */
+(void)setupWindow
{
    //隐藏window
    window_.hidden = YES;
    
    //frame数据
    CGFloat windowH = 20;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = CGRectMake(0, -windowH, screenW, 20);
    
    //显示window
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:RCAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}


/**
 内部类-成功/失败/文字/图片文字调用这个类
 @param msg 提示文字
 @param image 提示图片
 */
+(void)showWithImage:(UIImage *)image Msg:(NSString *)msg
{
    //停止上次的timer
    [timer_ invalidate];
    
    //初始化window
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    button.titleLabel.font = RCFont;
    [button setTitle:msg forState:UIControlStateNormal];
    [window_ addSubview:button];
    
    //设置图片和inset
    if (image != nil) {
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [button setImage:image forState:UIControlStateNormal];
    }
    
    //计时器
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:RCDismissDuration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}


@end
