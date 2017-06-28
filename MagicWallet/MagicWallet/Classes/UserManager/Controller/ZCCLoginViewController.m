//
//  ZCCLoginViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCLoginViewController.h"
#import "ZCCInputView.h"
#import "ZCCCommon.h"
#import "ZCCFindPasswordViewController.h"
#import "ProgressHUD.h"
#import "ZCCRegisterViewController.h"
@interface ZCCLoginViewController ()

@property (nonatomic, weak)ZCCInputView *passwordView;
@property (nonatomic, weak)UIButton *loginBtn;

@property (nonatomic, weak)UIButton *registerBtn;

@end

@implementation ZCCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    [self addUI];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"user_bg_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
}

- (void)addUI{
    
    UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 44)];
    scrollerView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT - 63 - 44);
    scrollerView.showsVerticalScrollIndicator = NO;
    scrollerView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:scrollerView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(8, 10, SCREENWIDTH - 16, 71)];
    contentView.layer.cornerRadius = 3;
    contentView.clipsToBounds = YES;
    ZCCInputView *phoneNumberView = [ZCCInputView inputView];
    phoneNumberView.frame = CGRectMake(0, 0, SCREENWIDTH - 16, 35);
    phoneNumberView.itemNameLabel.text = @"手机号码：";
#pragma mark这个到时候要改
    phoneNumberView.inputLabeltextField.text = @"15706844165";
    
    ZCCInputView *passwordView = [ZCCInputView inputView];
    passwordView.frame = CGRectMake(0, 36, SCREENWIDTH - 16, 35);
    passwordView.itemNameLabel.text = @"登录密码：";
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, passwordView.height)];
    rightLabel.text = @"忘记密码?";
    rightLabel.font = [UIFont systemFontOfSize:12];
    rightLabel.textColor = ZCCRGBColor(95, 151, 217, 1.0);
    UITapGestureRecognizer *tapGe = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(forgetLabelClicked)];
    [rightLabel addGestureRecognizer:tapGe];
    rightLabel.userInteractionEnabled = YES;
    passwordView.inputLabeltextField.rightView = rightLabel;
    passwordView.inputLabeltextField.placeholder = @"请输入密码";
    passwordView.inputLabeltextField.rightViewMode = UITextFieldViewModeAlways;
    self.passwordView = passwordView;
    
    [contentView addSubview:phoneNumberView];
    [contentView addSubview:passwordView];
    
    [scrollerView addSubview:contentView];
    
    //登录按钮
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, CGRectGetMaxY(contentView.frame) + 15, SCREENWIDTH - 16, 35)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:ZCCRGBColor(106, 202, 249, 1.0)];
    loginBtn.layer.cornerRadius = 3;
    loginBtn.clipsToBounds = YES;
    [loginBtn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollerView addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    //注册按钮
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, CGRectGetMaxY(loginBtn.frame) + 15, SCREENWIDTH - 16, 35)];
    [registerBtn setTitle:@"通过手机号注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    registerBtn.layer.cornerRadius = 3;
    registerBtn.clipsToBounds = YES;
    [registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollerView addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
}

- (void)loginBtnClicked{
    NSLog(@"登录按钮点击了");
    
    long textNumber = [self.passwordView.inputLabeltextField.text length];
    if(textNumber < 6 || textNumber >16){
        [ProgressHUD showError:@"密码长度应为6-16位"];
    }
    
}

- (void)registerBtnClicked{
    NSLog(@"注册按钮点击了");
    ZCCRegisterViewController *registerVC = [[ZCCRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)forgetLabelClicked{
    NSLog(@"忘记密码点击了");
    
    ZCCFindPasswordViewController *findVC = [[ZCCFindPasswordViewController alloc] init];
    
    [self.navigationController pushViewController:findVC animated:YES];
}

@end
