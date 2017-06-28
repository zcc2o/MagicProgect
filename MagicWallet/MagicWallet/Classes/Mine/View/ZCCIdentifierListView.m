//
//  ZCCIdentifierListView.m
//  MagicWallet
//
//  Created by mac on 2017/6/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCIdentifierListView.h"

@implementation ZCCIdentifierListView

- (instancetype)init{
    return [[NSBundle mainBundle] loadNibNamed:@"ZCCIdentifierListView" owner:self options:nil].lastObject;
}

@end
