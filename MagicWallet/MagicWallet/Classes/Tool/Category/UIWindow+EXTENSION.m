//
//  UIWindow+EXTENSION.m
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "UIWindow+EXTENSION.h"

#import "ZCCTabBarViewController.h"

#import "ZCCNewFeatureViewController.h"

@implementation UIWindow (EXTENSION)

- (void)swithchRootController{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *oldVersion = [userDefault stringForKey:@"CFBundleShortVersionString"];
    
    NSString *newVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    if([oldVersion isEqualToString:newVersion]){
        
        ZCCTabBarViewController *tabBarVC = [[ZCCTabBarViewController alloc] init];
        
        self.rootViewController = tabBarVC;
    }else{
        ZCCNewFeatureViewController *newFeatureVC = [[ZCCNewFeatureViewController alloc] init];
        
        self.rootViewController = newFeatureVC;
        
        [userDefault setObject:newVersion forKey:@"CFBundleShortVersionString"];
    }
}

@end
