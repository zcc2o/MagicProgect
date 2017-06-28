//
//  ZCCOrderTableViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCOrderTableViewController.h"
#import "ZCCCommon.h"
#import "ZCCHelpCenterTableViewController.h"
@interface ZCCOrderTableViewController ()

@property (nonatomic, strong)UIView *centerView;

@end

@implementation ZCCOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    
    UIBarButtonItem *helpBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"help"] style:UIBarButtonItemStylePlain target:self action:@selector(helpBtnClicked)];
    
    self.navigationItem.rightBarButtonItem = helpBtn;
}

- (void)viewWillAppear:(BOOL)animated{
    
    //判断有没有借款 没有就显示下面的view 有就不显示
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake((SCREENWIDTH - 120)/2, 100, 120, 100)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 70, 70)];
    imageView.image = [UIImage imageNamed:@"developing"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 120, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"您还未有借款订单";
    label.font = [UIFont systemFontOfSize:13];
    
    [centerView addSubview:label];
    [centerView addSubview:imageView];
    
    [self.view addSubview:centerView];
    
    self.centerView = centerView;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.centerView removeFromSuperview];
    
}

- (void)helpBtnClicked{
    
    ZCCHelpCenterTableViewController *helpVC = [[ZCCHelpCenterTableViewController alloc] init];
    
    [self.navigationController pushViewController:helpVC animated:YES];
    
}


@end
