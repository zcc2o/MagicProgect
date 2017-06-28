//
//  ZCCInputView.m
//  
//
//  Created by mac on 2017/6/26.
//
//

#import "ZCCInputView.h"

@implementation ZCCInputView

+ (instancetype)inputView{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCCInputView" owner:self options:nil].lastObject;
}


@end
