//
//  ZCCNavigationViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCNavigationViewController.h"

@interface ZCCNavigationViewController ()

@end

@implementation ZCCNavigationViewController

- (void)viewDidLoad{
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    self.navigationBar.titleTextAttributes = textAttributes;
    
}

@end
