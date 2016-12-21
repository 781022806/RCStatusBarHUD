//
//  AppDelegate.h
//  RCStatusBarHUDExample
//
//  Created by ruchu on 2016/12/21.
//  Copyright © 2016年 churu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

