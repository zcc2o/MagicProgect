//
//  UILabel+EXTENSION.h
//  MagicWallet
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSTimer *_countTimer;

@interface UILabel (EXTENSION)

- (void)zcc_beginCountDownWithDuration:(NSTimeInterval)duration;

- (void)zcc_stopCountDown;

@end
