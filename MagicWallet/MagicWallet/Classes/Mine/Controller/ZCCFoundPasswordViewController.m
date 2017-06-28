//
//  ZCCFoundPasswordViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCFoundPasswordViewController.h"
#import "ZCCInputView.h"
#import "ZCCCommon.h"
#import "ProgressHUD.h"
#import "ZCCFindPasswordViewController.h"
@interface ZCCFoundPasswordViewController ()

@property (nonatomic, weak)ZCCInputView *originPasswordView;

@property (nonatomic, weak)ZCCInputView *passwordView;

@property (nonatomic, weak)ZCCInputView *ensurePassword;

@end

@implementation ZCCFoundPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addUI];
    [self.view setBackgroundColor:ZCCRGBColor(240, 240, 240, 1.0)];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"user_bg_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.alpha = 1;
    
    UIBarButtonItem *forgetBtn = [[UIBarButtonItem alloc] initWithTitle:@"忘记密码" style:UIBarButtonItemStylePlain target:self action:@selector(forgetBtnClicked)];
    
    self.navigationItem.rightBarButtonItem = forgetBtn;
}

- (void)addUI{
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10 + 64, SCREENWIDTH, 35 * 3 + 2)];
    
    ZCCInputView *originPasswordView = [ZCCInputView inputView];
    originPasswordView.frame = CGRectMake(10, 0, SCREENWIDTH - 20, 35);
    originPasswordView.itemNameLabel.text = @"原密码：";
    originPasswordView.inputLabeltextField.placeholder = @"必填";
    self.originPasswordView = originPasswordView;
    
    ZCCInputView *passwordView = [ZCCInputView inputView];
    passwordView.frame = CGRectMake(10, 36, SCREENWIDTH - 20, 35);
    passwordView.itemNameLabel.text = @"新密码：";
    passwordView.inputLabeltextField.placeholder = @"必填，至少六位";
    self.passwordView = passwordView;
    
    ZCCInputView *ensurePassword = [ZCCInputView inputView];
    ensurePassword.frame = CGRectMake(10, 72, SCREENWIDTH - 20, 35);
    ensurePassword.itemNameLabel.text = @"确定密码：";
    ensurePassword.inputLabeltextField.placeholder = @"必填,至少六位";
    self.ensurePassword = ensurePassword;
    
    [contentView addSubview:originPasswordView];
    [contentView addSubview:passwordView];
    [contentView addSubview:ensurePassword];
    
    [self.view addSubview:contentView];
    
    UIButton *inSureBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(contentView.frame) + 20, SCREENWIDTH - 60, 35)];
    [inSureBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    inSureBtn.backgroundColor = ZCCRGBColor(22, 159, 239, 1.0);
    [inSureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    inSureBtn.layer.cornerRadius = 3;
    inSureBtn.clipsToBounds = YES;
    [inSureBtn addTarget:self action:@selector(inSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:inSureBtn];
}

- (void)inSureBtnClicked{
    
    long passwordLength = [self.passwordView.inputLabeltextField.text length];
    
    if(passwordLength < 6 || passwordLength > 16){
        [ProgressHUD showError:@"密码长度必须在6~16位之间"];
    }else if (![_passwordView.inputLabeltextField.text isEqualToString:_ensurePassword.inputLabeltextField.text]){
        [ProgressHUD showError:@"两次输入密码不同,请重新输入"];
    }else{
        [ProgressHUD showSuccess:@"成功"];
    }
    
}

- (void)forgetBtnClicked{
    
    ZCCFindPasswordViewController *findVC = [[ZCCFindPasswordViewController alloc] init];
    
    [self.navigationController pushViewController:findVC animated:YES];
}



@end
