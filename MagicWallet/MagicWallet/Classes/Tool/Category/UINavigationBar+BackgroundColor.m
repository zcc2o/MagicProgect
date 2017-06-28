//
//  UINavigationBar+BackgroundColor.m
//  MagicWallet
//
//  Created by mac on 2017/6/20.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "UINavigationBar+BackgroundColor.h"
#import <objc/runtime.h>
@implementation UINavigationBar (BackgroundColor)

static char UINavigationBarOverlayKey;

- (UIView *)overlay{
    return objc_getAssociatedObject(self, &UINavigationBarOverlayKey);
}

- (void)setOverlay:(UIView *)overlay{
    
    objc_setAssociatedObject(self, &UINavigationBarOverlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)zcc_setBackgroundColor:(UIColor *)backgroundColor{
    if(!self.overlay){
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, UIScreen.mainScreen.bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
}

- (void)zcc_reset{
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

@end
