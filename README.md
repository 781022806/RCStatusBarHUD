# RCStatusBarHUD
简单的状态栏指示器小框架
## 显示成功信息
```objc
[RCStatusBarHUD showSuccessWithMsg:@"加载成功"];
```

## 显示失败信息
```objc
[RCStatusBarHUD showErrorWithMsg:@"加载失败"];
```

## 显示加载信息
```objc
[RCStatusBarHUD showLoadingWithMsg:@"正在加载中..."];
```

## 显示普通信息
```objc
[RCStatusBarHUD showWithMsg:@"我没什么事儿"];
```

## 隐藏
```objc
[RCStatusBarHUD dismiss];
```
