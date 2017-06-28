//
//  ZCCRegisterViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCRegisterViewController.h"
#import "ZCCCommon.h"
#import "ZCCInputView.h"
#import "ProgressHUD.h"
#import "UILabel+EXTENSION.h"
@interface ZCCRegisterViewController ()

@property (nonatomic, weak)ZCCInputView *phoneNumber;

@property (nonatomic, weak)ZCCInputView *securityCode;

@property (nonatomic, weak)ZCCInputView *setPassword;

@property (nonatomic, weak)ZCCInputView *ensurePassword;

@property (nonatomic, weak)UILabel *rightLabel;

@end

@implementation ZCCRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    [self addUI];
}

- (void)addUI{
    
    UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 44)];
    scrollerView.showsVerticalScrollIndicator = NO;
    scrollerView.showsHorizontalScrollIndicator = NO;
    scrollerView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT - 63 - 44);
    
    [self.view addSubview:scrollerView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREENWIDTH, 35 * 4 + 3)];
    
    ZCCInputView *phoneNumber = [ZCCInputView inputView];
    phoneNumber.frame = CGRectMake(10, 0, SCREENWIDTH - 20, 35);
    phoneNumber.itemNameLabel.text = @"手机号码：";
    phoneNumber.inputLabeltextField.text = @"15706844165";
    self.phoneNumber = phoneNumber;
    
    ZCCInputView *securityCode = [ZCCInputView inputView];
    securityCode.frame = CGRectMake(10, 36, SCREENWIDTH - 20, 35);
    securityCode.itemNameLabel.text = @"验证码：";
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, securityCode.height)];
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.text = @"获取验证码  ";
    rightLabel.userInteractionEnabled = YES;
    rightLabel.font = [UIFont systemFontOfSize:12];
    rightLabel.textColor = ZCCRGBColor(95, 151, 217, 1.0);
    self.rightLabel = rightLabel;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getSecurityCode)];
    [rightLabel addGestureRecognizer:tapGesture];
    
    securityCode.inputLabeltextField.rightView = rightLabel;
    securityCode.inputLabeltextField.placeholder = @"验证码";
    securityCode.inputLabeltextField.rightViewMode = UITextFieldViewModeAlways;
    self.securityCode = securityCode;
    
    ZCCInputView *setPassword = [ZCCInputView inputView];
    setPassword.frame = CGRectMake(10, 72, SCREENWIDTH - 20, 35);
    setPassword.itemNameLabel.text = @"设置密码：";
    setPassword.inputLabeltextField.placeholder = @"请设置密码，6-16位";
    self.setPassword = setPassword;
    
    ZCCInputView *ensurePassword = [ZCCInputView inputView];
    ensurePassword.frame = CGRectMake(10, 108, SCREENWIDTH - 20, 35);
    ensurePassword.itemNameLabel.text = @"确认密码：";
    ensurePassword.inputLabeltextField.placeholder = @"请确认密码";
    self.ensurePassword = ensurePassword;
    
    [contentView addSubview:phoneNumber];
    [contentView addSubview:securityCode];
    [contentView addSubview:setPassword];
    [contentView addSubview:ensurePassword];
    
    [scrollerView addSubview:contentView];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(contentView.frame) + 20, SCREENWIDTH - 60, 35)];
    [registerBtn setTitle:@"确定" forState:UIControlStateNormal];
    registerBtn.backgroundColor = ZCCRGBColor(22, 159, 239, 1.0);
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 3;
    registerBtn.clipsToBounds = YES;
    [registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollerView addSubview:registerBtn];
}

- (void)registerBtnClicked{
    NSLog(@"注册按钮点击了");
    
    long passwordLength = [_setPassword.inputLabeltextField.text length];
    
    if([self.securityCode.inputLabeltextField.text isEqualToString:@""]){
        [ProgressHUD showError:@"验证码不为空"];
    }else if (passwordLength < 6 || passwordLength > 16){
        [ProgressHUD showError:@"密码长度不符合"];
    }else if (![_setPassword.inputLabeltextField.text isEqualToString:_ensurePassword.inputLabeltextField.text]){
        [ProgressHUD showError:@"两次输入密码不相同"];
    }else{
        [ProgressHUD showSuccess:@"注册中..."];//Interaction: NO加上黑色半透明蒙版  YES不加
//        [ProgressHUD show:@"注册中..." Interaction:NO];
    }
    
}

- (void)getSecurityCode{
    
    [self.rightLabel zcc_beginCountDownWithDuration:60];
    
}

@end
