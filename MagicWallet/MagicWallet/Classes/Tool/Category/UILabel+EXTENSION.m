//
//  UILabel+EXTENSION.m
//  MagicWallet
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "UILabel+EXTENSION.h"
#import "ZCCCommon.h"


static NSTimeInterval _count;
static NSString *_text;

@implementation UILabel (EXTENSION)

- (void)zcc_beginCountDownWithDuration:(NSTimeInterval)duration{
    
    _text = self.text;
    _count = duration;
    
    _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTitle) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_countTimer forMode:NSRunLoopCommonModes];
    self.userInteractionEnabled = NO;
    
//    _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:]
    
}

- (void)updateTitle{
    
    NSString *countString = [NSString stringWithFormat:@"发送验证码(%lis)", (long)_count - 1];
    
    self.userInteractionEnabled = NO;
    self.text = countString;
    
    if(_count-- <= 1.0){
        
        [self zcc_stopCountDown];
        
    }
    
}

- (void)zcc_stopCountDown{
    
    [_countTimer invalidate];
    _countTimer = nil;
    _count = 60.0;
    self.text = _text;
    self.userInteractionEnabled = YES;
}

@end

/*

 - (void)xs_beginCountDownWithDuration:(NSTimeInterval)duration {
 _title = self.titleLabel.text;
 _count = duration;
 _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(xs_updateTitle) userInfo:nil repeats:YES];
 [[NSRunLoop mainRunLoop] addTimer:_countTimer forMode:NSRunLoopCommonModes];
 self.userInteractionEnabled = NO;
 
 [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 self.backgroundColor = [UIColor lightGrayColor];
 self.layer.borderColor = [UIColor clearColor].CGColor;
 self.clipsToBounds = YES;
 }
 
 - (void)xs_stopCountDown {
 [_countTimer invalidate];
 _countTimer = nil;
 _count = 60.0;
 [self setTitle:_title forState:UIControlStateNormal];
 self.userInteractionEnabled = YES;
 }
 
 - (void)xs_updateTitle {
 NSString *countString = [NSString stringWithFormat:@"%lis 后失效", (long)_count - 1];
 self.userInteractionEnabled = NO;
 [self setTitle:countString forState:UIControlStateNormal];
 if (_count-- <= 1.0) {
 [self xs_stopCountDown];
 [self setTitleColor:THEME_RED forState:UIControlStateNormal];
 self.backgroundColor = [UIColor whiteColor];
 self.layer.borderColor = THEME_RED.CGColor;
 }
*/
