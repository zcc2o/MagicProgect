//
//  ZCCTabBarViewController.m
//  ApieceZCC
//
//  Created by qx-005 on 2017/4/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCTabBarViewController.h"
#import "ZCCOrderTableViewController.h"
#import "ZCCBorrowViewController.h"
#import "ZCCMineTableViewController.h"
#import "ZCCNavigationViewController.h"
#import "ZCCCommon.h"

@interface ZCCTabBarViewController ()

@end

@implementation ZCCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildVC];
    
    
}

- (void)addChildVC{
    
    ZCCBorrowViewController *borrowVC = [[ZCCBorrowViewController alloc] init];
    [self addChildVC:borrowVC andTabBarText:@"借款" andImageName:@"tabBar_icon_1-1" andSelectedImageName:@"tabBar_icon_2-1"];
    
    ZCCOrderTableViewController *orderVC = [[ZCCOrderTableViewController alloc] init];
    [self addChildVC:orderVC andTabBarText:@"订单" andImageName:@"tabBar_icon_11-1" andSelectedImageName:@"tabBar_icon_12-1"];
    
    ZCCMineTableViewController *mineVC = [[ZCCMineTableViewController alloc] init];
    [self addChildVC:mineVC andTabBarText:@"我的" andImageName:@"tabBar_icon_9-1" andSelectedImageName:@"tabBar_icon_10-1"];

    //加tabbar上面的分割线
//    CGRect rect = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
//    
//    UIGraphicsBeginImageContext(rect.size);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    
//    CGContextFillRect(context, rect);
//    
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    [self.tabBar setShadowImage:img];
//    
//    [self.tabBar setShadowImage:img];
//    self.tabBar.layer.shadow
}

- (void)addChildVC:(UIViewController *)childVC andTabBarText:(NSString *)text andImageName:(NSString *)imageStr andSelectedImageName:(NSString *)selectedImageStr{
    //设置tabbar图片
    childVC.tabBarItem.image = [UIImage imageNamed:imageStr];
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageStr];
    
    UIImage *noRenderImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.selectedImage = noRenderImage;
    //设置tabbar标题
    childVC.tabBarItem.title = text;
    
    NSDictionary *textAttribute = @{NSForegroundColorAttributeName : ZCCRGBColor(56, 84, 183, 1)};
    
    [childVC.tabBarItem setTitleTextAttributes:textAttribute forState:UIControlStateSelected];
    
    ZCCNavigationViewController *navVC = [[ZCCNavigationViewController alloc] initWithRootViewController:childVC];
//    if([text isEqualToString:@"我的"]){
//        text = @"";
//    }
    childVC.title = text;
    
    [self addChildViewController:navVC];
}

@end
