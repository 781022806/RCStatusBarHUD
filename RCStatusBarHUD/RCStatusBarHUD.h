//
//  RCStatusBarHUD.h
//  04-RCStatusBarHUD
//
//  Created by ruchu on 2016/12/19.
//  Copyright © 2016年 churu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCStatusBarHUD : NSObject

/**
 显示成功和成功的提示文字
 @param msg 成功的提示文字
 */
+(void)showSuccessWithMsg:(NSString *)msg;

/**
 显示失败和失败的提示文字
 @param msg 失败的提示文字
 */
+(void)showErrorWithMsg:(NSString *)msg;
/**
 显示加载中和提示文字
 @param msg 加载中的提示文字
 */
+(void)showLoadingWithMsg:(NSString *)msg;
/**
 普通提示
 @param msg 提示文字
 */
+(void)showWithMsg:(NSString *)msg;
/**
 带图片的普通提示
 @param msg 提示文字
 @param image 提示图片
 */
+(void)showWithMsg:(NSString *)msg image:(UIImage *)image;
/**
 隐藏控制器
 */
+(void)dismiss;

@end
