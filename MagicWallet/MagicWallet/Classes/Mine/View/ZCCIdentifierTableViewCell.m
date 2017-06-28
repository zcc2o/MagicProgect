//
//  ZCCIdentifierTableViewCell.m
//  MagicWallet
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCIdentifierTableViewCell.h"
#import "ZCCCommon.h"

@interface ZCCIdentifierTableViewCell()<UITextFieldDelegate>



@end

@implementation ZCCIdentifierTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 30)];
        itemName.font = [UIFont systemFontOfSize:12];
        itemName.textColor = [UIColor blackColor];
        self.itemName = itemName;
        [self addSubview:itemName];
        
        UITextField *inputField = [[UITextField alloc] initWithFrame:CGRectMake(60 + 10 + 10, 5, SCREENWIDTH - 90, 20)];
        inputField.font = [UIFont systemFontOfSize:12];
        inputField.textAlignment = NSTextAlignmentRight;
        inputField.placeholder = @"必填";
        inputField.textColor = [UIColor blackColor];
        inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
//        inputField.delegate = self;
        self.inputField = inputField;
        [self addSubview:inputField];
    }
    return self;
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    
//    UIButton *deleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//    [deleBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    self.inputField.rightView = deleBtn;
//    
//}

@end
