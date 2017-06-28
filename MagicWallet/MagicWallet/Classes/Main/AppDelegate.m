//
//  AppDelegate.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "AppDelegate.h"
#import "ZCCTabBarViewController.h"
#import "UIWindow+EXTENSION.h"
#import "ZCCLoginViewController.h"
#import "ZCCNavigationViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window swithchRootController];
    
//    ZCCLoginViewController *loginVC = [[ZCCLoginViewController alloc] init];
//    
//    ZCCNavigationViewController *naVC = [[ZCCNavigationViewController alloc] initWithRootViewController:loginVC];
    
//    self.window.rootViewController = naVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
