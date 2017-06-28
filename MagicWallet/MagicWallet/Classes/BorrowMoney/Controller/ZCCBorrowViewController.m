//
//  ZCCBorrowViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCBorrowViewController.h"
#import "UINavigationBar+BackgroundColor.h"
#import "ZCCCommon.h"
#import "NSString+EXTENSION.h"
#import <sys/utsname.h>

@interface ZCCBorrowViewController ()

@property (nonatomic, weak)UIScrollView *scrollV;

@property (nonatomic, weak)UIScrollView *scrollPics;

@property (nonatomic, weak)UIView *borrowView;

@property (nonatomic, weak)UILabel *phoneName;

@end

@implementation ZCCBorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"魔力钱包";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    
    [self addUI];
    
}

- (void)addUI{
    
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64)];
    self.scrollV = scrollV;
    scrollV.backgroundColor = ZCCRGBColor(240, 240, 240, 1);
    

    [self.view addSubview:scrollV];
    
    UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 10, SCREENWIDTH, 10)];
    bottomLine.text = @"我是底线";
    bottomLine.font = [UIFont systemFontOfSize:10.0];
    bottomLine.backgroundColor = [UIColor whiteColor];
    bottomLine.textAlignment = NSTextAlignmentCenter;
    [_scrollV addSubview:bottomLine];
    
    
    //ppt播放框
    UIScrollView *scrollPics = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150)];
    self.scrollPics = scrollPics;
    scrollPics.contentSize = CGSizeMake(SCREENWIDTH * 3, 150);
    scrollPics.pagingEnabled = YES;
    [self.scrollV addSubview:scrollPics];
    [self addScrollPictures];
    
    //我要借贷框
//    UIView *borrowPic = [[UIView alloc] initWithFrame:CGRectMake(15, 160, SCREENWIDTH - 30, 134 * (SCREENWIDTH - 30)/291)];
    UIView *borrowView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, SCREENWIDTH, 200)];
    borrowView.backgroundColor = ZCCRGBColor(242, 242, 242, 1);
    self.borrowView = borrowView;
    
    UIImageView *borrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
    borrowImg.image = [UIImage imageNamed:@"wallet_bg_th_01"];
    [borrowView addSubview:borrowImg];
    [self.scrollV addSubview:borrowView];
    
    //产品简介
    UILabel *introduction = [[UILabel alloc] initWithFrame:CGRectMake(5, 360, 200, 8)];
    introduction.text = @"产品简介";
    introduction.font = [UIFont systemFontOfSize:12];
    introduction.textColor = ZCCRGBColor(93, 139, 240, 1);
    [self.scrollV addSubview:introduction];
    
    NSString *contentStr = @"1.年满18周岁，苹果手机为6及以上，已实名认证且已绑定银行卡的用户可申请。\n2.本产品是抵押手机进行贷款，更具手机型号酱油不同的借款金额。\n3.用户若违约，本公司有权对用户手机进行任何处理。\n4.在申请资料齐全的情况下，请您耐心等待，会在24小时给到您的审核结果。";
    
    CGSize contentSize = [contentStr sizewithFont:[UIFont systemFontOfSize:12] andMaxSize:CGSizeMake(SCREENWIDTH - 10, MAXFLOAT)];
    
    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(5, 380, SCREENWIDTH - 10, contentSize.height)];
    content.numberOfLines = 0;
    content.font = [UIFont systemFontOfSize:12];
    content.text = contentStr;
    content.textColor = ZCCRGBColor(130, 130, 130, 1.0);
    [self.scrollV addSubview:content];
    
    scrollV.contentSize = CGSizeMake(SCREENWIDTH, CGRectGetMaxY(content.frame) + 20);
    
    [self addUIOnBorrowView];
    
}

- (void)addScrollPictures{
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SCREENWIDTH, 0, SCREENWIDTH, 150)];
        
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"help%d",i + 1]]];
        
        [self.scrollPics addSubview:imgView];
    }
}

- (void)addUIOnBorrowView{
    //距离上面8  距离左边15
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5 + 15 + 8, 5 + 8 + 5, 50, 50)];
    iconImageView.image = [UIImage imageNamed:@"user_default_icon"];
    [self.borrowView addSubview:iconImageView];
    
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame) + 5, iconImageView.y, 100, 20)];
    username.font = [UIFont systemFontOfSize:16];
    username.text = @"我要借款";
    username.textColor = [UIColor whiteColor];
    
    NSString *phoneType = [self iphoneType];
    UILabel *phoneName = [[UILabel alloc] initWithFrame:CGRectMake( username.x, CGRectGetMaxY(username.frame) + 8, 110, 15)];
    phoneName.font = [UIFont systemFontOfSize:13];
    phoneName.text = phoneType;
    phoneName.textColor = [UIColor whiteColor];
    
    [self.borrowView addSubview:username];
    [self.borrowView addSubview:phoneName];
    //认证按钮
    UIButton *identificationBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENWIDTH - 5 - 15 - 70, username.y, 60, 20)];
    [identificationBtn setTitle:[NSString stringWithFormat:@"认证%d/%d",0,5] forState:UIControlStateNormal];
    [identificationBtn setBackgroundImage:[UIImage imageNamed:@"little1"] forState:UIControlStateNormal];
    [self.borrowView addSubview:identificationBtn];
    [identificationBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [identificationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //信用额度
    NSString *moneyLimit = @"￥ 2500";
    
    CGSize moneyLSize = [moneyLimit sizewithFont:[UIFont systemFontOfSize:28] andMaxSize:CGSizeMake(MAXFLOAT, 28)];
    
    UILabel *moneyLimitLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - moneyLSize.width - 8 - 15 - 5, 8 + 5 + 50 + 30 + 8, moneyLSize.width, 28)];
    moneyLimitLabel.text = moneyLimit;
    moneyLimitLabel.font = [UIFont systemFontOfSize:28];
    [self.borrowView addSubview:moneyLimitLabel];
    
    NSString *currentMoney = @"当前信用额度";
    CGSize currentMoneySize = [currentMoney sizewithFont:[UIFont systemFontOfSize:9] andMaxSize:CGSizeMake(MAXFLOAT, 9)];
    UILabel *currentMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(moneyLimitLabel.x - currentMoneySize.width - 5, 8 + 5 + 50 + 30 + 15 + 8, currentMoneySize.width, 9)];
    currentMoneyLabel.text = currentMoney;
    currentMoneyLabel.font = [UIFont systemFontOfSize:9];
    [self.borrowView addSubview:currentMoneyLabel];
    
    UIView *cutLineView = [[UIView alloc] initWithFrame:CGRectMake(26,  8 + 5 + 50 + 30 + 15 + 20 + 25, SCREENWIDTH - 49, 1)];
    cutLineView.backgroundColor = ZCCRGBColor(230, 230, 230, 1);
    [self.borrowView addSubview:cutLineView];
    
    NSString *mineBorrowStr = @"您还未有借款，赶紧行动吧！  >>";
    CGSize mineBorrowSize = [mineBorrowStr sizewithFont:[UIFont systemFontOfSize:9] andMaxSize:CGSizeMake(MAXFLOAT, 9)];
    
    UILabel *mineBorrowLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 15 - 5 - mineBorrowSize.width - 5, cutLineView.y + 12, mineBorrowSize.width, 9)];
    mineBorrowLabel.font = [UIFont systemFontOfSize:9];
    mineBorrowLabel.text = mineBorrowStr;
    mineBorrowLabel.textColor = [UIColor whiteColor];
    [self.borrowView addSubview:mineBorrowLabel];
    
}

- (NSString *)iphoneType{
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    
    NSLog(@"platform:%@",platform);
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return @"未知型号";
}

@end
