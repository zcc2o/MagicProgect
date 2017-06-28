//
//  ZCCMineTableViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCMineTableViewController.h"
#import "ZCCCommon.h"
#import "NSString+EXTENSION.h"
#import "ZCCIdentifierListView.h"
#import "ZCCMineListTableViewCell.h"
#import "ZCCRealIdentiferTableViewController.h"
#import "ZCCSettingTableViewController.h"
#import "ZCCFoundPasswordViewController.h"

@interface ZCCMineTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UIImageView *statusBarView;

@property (nonatomic, weak)UIView *tableHeadView;

@property (nonatomic, weak)UIImageView *imageView;

@property (nonatomic, weak)UIView *navView;

@property (nonatomic, weak)ZCCIdentifierListView *identifierView;

@property (nonatomic, weak)UILabel *cutLine;

@property (nonatomic, strong)NSMutableArray *mineMenuList;

@end

CGFloat navAlpha = 0;

@implementation ZCCMineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setNavBg];
    
    [self addUI];
    
    self.tableView = [self.tableView initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    /*
    UITableViewCellSeparatorStyleNone,
    UITableViewCellSeparatorStyleSingleLine,
    UITableViewCellSeparatorStyleSingleLineEtched
     */
    
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}

- (void)settingBtnClicked{
    
    ZCCSettingTableViewController *settingVC = [[ZCCSettingTableViewController alloc] init];
    
    [self.navigationController pushViewController:settingVC animated:YES];
}

//直接把导航条加到keywindow上面/Users/mac/Desktop/MagicWallet/MagicWallet
- (void)viewWillAppear:(BOOL)animated{

    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 64)];
//    [navView setBackgroundColor:[UIColor redColor]];
    
    UIButton *logOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, 50, 30)];
    
    [logOutBtn setTitle:@"退出" forState:UIControlStateNormal];
    
    [logOutBtn addTarget:self action:@selector(logOutBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
//    UIBarButtonItem *settingBtn = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked)];
    
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50, 25, 50, 30)];
    [settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [navView addSubview:settingBtn];
    
    [navView addSubview:logOutBtn];
    
    self.navView = navView;
    
    UIApplication *application = [UIApplication sharedApplication];
    [application.keyWindow insertSubview:navView aboveSubview:self.navigationController.navigationBar];
    
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated{

    [self.navView removeFromSuperview];
    
}

- (void)setNavBg{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //navigationBar设置透明 这是上面20像素的那条
    UIImageView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, 20)];
    
    self.statusBarView = statusBarView;
    
    [self.navigationController.navigationBar addSubview:statusBarView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    
    self.navigationItem.titleView = titleLabel;
    //隐藏nav下面那条线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
//设置tableview的headView

- (void)addUI{
    
    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 305)];
    tableHeadView.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    UIImage *image = [UIImage imageNamed:@"user_bg_MoFaQianBao"];
//  在View上加图片
//    tableHeadView.layer.contents = (id)image.CGImage;
//    
//    tableHeadView.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 180)];
    imageView.image = image;
    //图片上加头像 点击实名 账号
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 50, 50)];
    iconView.image = [UIImage imageNamed:@"user_default_icon"];
    iconView.layer.cornerRadius = 25;
    iconView.clipsToBounds = YES;
    [imageView addSubview:iconView];
    
    NSString *nameStr = @"点击实名认证";
    CGSize nameSize = [nameStr sizewithFont:[UIFont systemFontOfSize:14] andMaxSize:CGSizeMake(MAXFLOAT, 14)];
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame) + 10, iconView.y + 3, nameSize.width, nameSize.height)];
    userNameLabel.text = nameStr;
    userNameLabel.font = [UIFont systemFontOfSize:14];
    userNameLabel.textColor = [UIColor blueColor];
    [imageView addSubview:userNameLabel];
    
    NSString *phoneStr = @"15706844165";
    CGSize phoneSize = [phoneStr sizewithFont:[UIFont systemFontOfSize:12] andMaxSize:CGSizeMake(MAXFLOAT, 12)];
    
    UILabel *userPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(userNameLabel.x, CGRectGetMaxY(userNameLabel.frame) + 5, phoneSize.width, phoneSize.height)];
    userPhoneLabel.text = phoneStr;
    userPhoneLabel.font = [UIFont systemFontOfSize:12];
    userPhoneLabel.textColor = [UIColor whiteColor];
    [imageView addSubview:userPhoneLabel];
    
    self.imageView = imageView;
    [tableHeadView addSubview:imageView];
    
    self.tableView.tableHeaderView = tableHeadView;
    self.tableHeadView = tableHeadView;
    
    //分割线
    NSString *cutLine = @"——————  完善个人信息流程  ——————";
    CGSize cutLineSize = [cutLine sizewithFont:[UIFont systemFontOfSize:11] andMaxSize:CGSizeMake(MAXFLOAT, 11)];
    
    UILabel *cutLineLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - cutLineSize.width)/2, 180, cutLineSize.width, 18)];
    self.cutLine = cutLineLabel;
    cutLineLabel.font = [UIFont systemFontOfSize:11];
    cutLineLabel.textAlignment = NSTextAlignmentCenter;
    cutLineLabel.text = cutLine;
    
    [tableHeadView addSubview:cutLineLabel];
    
    //实名流程模块
    ZCCIdentifierListView *identifierView = [[ZCCIdentifierListView alloc] init];
    
    identifierView.frame = CGRectMake(0, 198, SCREENWIDTH, 100);
    self.identifierView = identifierView;
//    identifierView.backgroundColor = [UIColor whiteColor];
    [tableHeadView addSubview:identifierView];
    
}

- (void)logOutBtnClicked{
    NSLog(@"退出按钮点击了");
    
    __weak typeof(self)weakself = self;
    weakself.identifierView.hidden = YES;
    weakself.cutLine.hidden = YES;
    [UIView animateWithDuration:0.1 animations:^{
        weakself.tableHeadView.height = 190;
        [weakself.tableView reloadData];
    }];
    
//    self.tableHeadView.height = 190;
//    self.identifierView.hidden = YES;
//    self.cutLine.hidden = YES;
//    self.tableView.tableHeaderView = self.tableHeadView;
//    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    ZCCMineListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[ZCCMineListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *cellDic = [NSDictionary dictionary];
    
    switch (indexPath.section) {
        case 0:
        {
            cellDic = self.mineMenuList[0][indexPath.row];
        }
            break;
        case 1:
        {
            cellDic = self.mineMenuList[1][indexPath.row];
        }
            break;
        case 2:
        {
            cellDic = self.mineMenuList[2][indexPath.row];
        }
            break;
        default:
            break;
    }
    
    if(indexPath.row == 0 && indexPath.section == 0){
        
        cell.contentLabel.backgroundColor = [UIColor redColor];
        cell.contentLabel.textColor = [UIColor whiteColor];
        cell.contentLabel.font = [UIFont systemFontOfSize:10];
        cell.contentLabel.textAlignment = NSTextAlignmentCenter;
    }else if (indexPath.section == 0 && indexPath.row == 2){
        cell.contentLabel.textColor = ZCCRGBColor(230, 132, 27, 1.0);
    }else{
        cell.contentLabel.backgroundColor = [UIColor clearColor];
        cell.contentLabel.textColor = [UIColor redColor];
        cell.contentLabel.font = [UIFont systemFontOfSize:12];
        cell.contentLabel.textAlignment = NSTextAlignmentRight;
    }
    cell.contentLabel.text = cellDic[@"content"];
    
//    cell.dic = cellDic;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.iconView.image = [UIImage imageNamed:cellDic[@"icon"]];
    
    cell.titleLabel.text = cellDic[@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    {
                        ZCCRealIdentiferTableViewController *identifierVC = [[ZCCRealIdentiferTableViewController alloc] init];
                        [self.navigationController pushViewController:identifierVC animated:YES];
                    }
                    break;
                case 1:
                    
                    break;
                case 2:
                    
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            ZCCFoundPasswordViewController *passwordVC = [[ZCCFoundPasswordViewController alloc] init];
            
            [self.navigationController pushViewController:passwordVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //往上滑180PX  透明度 从0 到 1
    if(scrollView.contentOffset.y * 1.0/90 <= 1){
        navAlpha = scrollView.contentOffset.y * 1.0/90;
    }else{
        navAlpha = 1;
    }
//    这里改变navigation和20px的图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"user_bg_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.alpha = navAlpha;
    
    _statusBarView.image = [UIImage imageNamed:@"user_bg_MoFaQianBao"];
    _statusBarView.alpha = navAlpha;
    
//    NSLog(@"%lf",scrollView.contentOffset.y);
    
}

- (NSMutableArray *)mineMenuList{
    
    if(_mineMenuList == nil){
        
        _mineMenuList = [NSMutableArray array];
        
        for (int i = 0; i < 3 ; i++) {
            switch (i) {
                case 0:
                {
                    NSMutableArray *array1 = [NSMutableArray array];
                    
                    for (int j = 0; j < 3; j++) {
                            
                        NSDictionary *dic = @{@"icon":@"set_number", @"title":@"实名认证", @"content":@"还未通过实名认证"};
                        
                        [array1 addObject:dic];
                    }
                    
                    [_mineMenuList addObject:array1];
                }
                    break;
                case 1:
                {
                    NSMutableArray *array1 = [NSMutableArray array];
                    
                    for (int j = 0; j < 2; j++) {
                        
                        NSDictionary *dic = @{@"icon":@"set_number", @"title":@"实名认证", @"content":@"还未通过实名"};
                        
                        [array1 addObject:dic];
                    }
                    [_mineMenuList addObject:array1];
                }
                    break;
                case 2:
                {
                    NSMutableArray *array1 = [NSMutableArray array];
                    NSDictionary *dic = @{@"icon":@"set_edit", @"title":@"修改密码", @"content":@""};
                    [array1 addObject:dic];
                    [_mineMenuList addObject:array1];
                }
                    break;
                default:
                    break;
            }

        }
        
    }
    return _mineMenuList;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//比较卡 不知道什么原因
//    self.navigationController.navigationBar.translucent = YES;
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    UIColor *color1 = ZCCRGBColor(98, 143, 220,navAlpha);
//    UIColor *color2 = ZCCRGBColor(75, 212, 207,navAlpha);
//    gradientLayer.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor];
//    gradientLayer.locations = @[@0.5, @1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, -20, SCREENWIDTH, 64);
//    [self.navigationController.navigationBar.layer addSublayer:gradientLayer];
    
    
    
    //    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //往上滑180PX  透明度 从0 到 1
//    if(scrollView.contentOffset.y * 1.0/180 <= 1 && scrollView.contentOffset.y * 1.0/180 >= 0){
//        navAlpha = scrollView.contentOffset.y * 1.0/180;
//    }else if(scrollView.contentOffset.y * 1.0/180 > 1){
//        navAlpha = 1;
//    }else{
//        navAlpha = 0;
//    }
//}



@end
