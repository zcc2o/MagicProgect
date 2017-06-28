//
//  ZCCFindPasswordViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCFindPasswordViewController.h"
#import "ZCCInputView.h"
#import "ZCCCommon.h"
#import "UILabel+EXTENSION.h"
@interface ZCCFindPasswordViewController ()

@property (nonatomic, weak)ZCCInputView *phoneNumber;

@property (nonatomic, weak)ZCCInputView *securityCode;

@property (nonatomic, weak)ZCCInputView *nowPassword;

@property (nonatomic, weak)ZCCInputView *ensurePassword;

@property (nonatomic, weak)UILabel *rightLabel;

@end

@implementation ZCCFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addUI];
    [self.view setBackgroundColor:ZCCRGBColor(240, 240, 240, 1.0)];
}

- (void)addUI{
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10 + 64, SCREENWIDTH, 35 * 4 + 3)];
    
    ZCCInputView *phoneNumber = [ZCCInputView inputView];
    phoneNumber.frame = CGRectMake(10, 0, SCREENWIDTH - 20, 35);
    phoneNumber.itemNameLabel.text = @"手机号码：";
    phoneNumber.inputLabeltextField.text = @"15706844165";
    self.phoneNumber = phoneNumber;
    
    ZCCInputView *securityCode = [ZCCInputView inputView];
    securityCode.frame = CGRectMake(10, 36, SCREENWIDTH - 20, 35);
    securityCode.itemNameLabel.text = @"验证码：";
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, securityCode.height)];
    rightLabel.text = @"获取验证码  ";
    rightLabel.font = [UIFont systemFontOfSize:12];
    rightLabel.textColor = ZCCRGBColor(95, 151, 217, 1.0);
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.userInteractionEnabled = YES;
    self.rightLabel = rightLabel;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getSecurityCode)];
    [rightLabel addGestureRecognizer:tapGesture];
    
    securityCode.inputLabeltextField.rightView = rightLabel;
    securityCode.inputLabeltextField.placeholder = @"验证码";
    securityCode.inputLabeltextField.rightViewMode = UITextFieldViewModeAlways;
    self.securityCode = securityCode;
    
    ZCCInputView *nowPassword = [ZCCInputView inputView];
    nowPassword.frame = CGRectMake(10, 72, SCREENWIDTH - 20, 35);
    nowPassword.itemNameLabel.text = @"新密码：";
    nowPassword.inputLabeltextField.placeholder = @"请输入新密码";
    self.nowPassword = nowPassword;
    
    ZCCInputView *ensurePassword = [ZCCInputView inputView];
    ensurePassword.frame = CGRectMake(10, 108, SCREENWIDTH - 20, 35);
    ensurePassword.itemNameLabel.text = @"确定密码：";
    ensurePassword.inputLabeltextField.placeholder = @"请输入新密码";
    self.ensurePassword = ensurePassword;
    
    [contentView addSubview:phoneNumber];
    [contentView addSubview:securityCode];
    [contentView addSubview:nowPassword];
    [contentView addSubview:ensurePassword];
    
    [self.view addSubview:contentView];
    
    UIButton *inSureBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(contentView.frame) + 20, SCREENWIDTH - 60, 35)];
    [inSureBtn setTitle:@"确定" forState:UIControlStateNormal];
    inSureBtn.backgroundColor = ZCCRGBColor(22, 159, 239, 1.0);
    [inSureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    inSureBtn.layer.cornerRadius = 3;
    inSureBtn.clipsToBounds = YES;
    [inSureBtn addTarget:self action:@selector(inSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:inSureBtn];
}

- (void)inSureBtnClicked{
    NSLog(@"确定按钮按下");
}

- (void)getSecurityCode{
    [self.rightLabel zcc_beginCountDownWithDuration:60];
}

@end
