//
//  ZCCNewFeatureViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCNewFeatureViewController.h"
#import "ZCCCommon.h"
#import "ZCCTabBarViewController.h"

#define IMAGENUMBER 3

@interface ZCCNewFeatureViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak)UIScrollView *scrollerView;

@property (nonatomic, weak)UIPageControl *pageControl;

@property (nonatomic, weak)UIButton *enterBtn;

@end

@implementation ZCCNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addUI];
}


- (void)addUI{
    
    UIScrollView *scrollerView = [[UIScrollView alloc] init];
    
    scrollerView.frame = self.view.frame;
    
    scrollerView.contentSize = CGSizeMake(SCREENWIDTH *IMAGENUMBER, 0);
    
    scrollerView.pagingEnabled = YES;//是否整页翻过
    
    scrollerView.bounces = NO;
    
    scrollerView.showsHorizontalScrollIndicator = NO;//是否有横向进度滑块
    
    scrollerView.delegate = self;
    
    [self.view addSubview:scrollerView];
    
    self.scrollerView = scrollerView;
    
    [self addScrollerImages];
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    pageControl.numberOfPages = IMAGENUMBER;
    
//    pageControl.backgroundColor = [UIColor purpleColor];
    
    pageControl.centerX = self.view.centerX;
    
    pageControl.y = self.view.height - 60;
    
    pageControl.currentPageIndicatorTintColor = ZCCRGBColor(88, 170, 214, 1.0);
    
    pageControl.pageIndicatorTintColor = ZCCRGBColor(128, 128, 128, 1.0);
    
    self.pageControl = pageControl;
    
    [self.view addSubview:pageControl];
    
    UIButton *enterBtn = [[UIButton alloc] init];
    
//    [enterBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    
//    [enterBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
//    enterBtn.size = enterBtn.currentBackgroundImage.size;
    enterBtn.size = CGSizeMake(100, 40);
    
    enterBtn.x = (self.view.width - enterBtn.width) * 1.0 / 2;
    
    enterBtn.y = self.view.height - 120;
    
    enterBtn.backgroundColor = [UIColor blueColor];
    
    [enterBtn addTarget:self action:@selector(enterBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:enterBtn];
    
    enterBtn.hidden = YES;
    
    self.enterBtn = enterBtn;
    
}

- (void)addScrollerImages{
    
    for(int i = 0; i< IMAGENUMBER; i++){
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.frame = CGRectMake(i * SCREENWIDTH, 0, SCREENWIDTH, self.scrollerView.height);
        
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        
        [self.scrollerView addSubview:imageView];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat contentOffX = scrollView.contentOffset.x;
    
    NSInteger page = (int)contentOffX / (int)scrollView.width;
    
    if(page == 2){
        _enterBtn.hidden = NO;
    }else{
        _enterBtn.hidden = YES;
    }
    
    self.pageControl.currentPage = page;
    
}

- (void)enterBtnClicked{
    
    ZCCTabBarViewController *tabBarController = [[ZCCTabBarViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
}


@end
