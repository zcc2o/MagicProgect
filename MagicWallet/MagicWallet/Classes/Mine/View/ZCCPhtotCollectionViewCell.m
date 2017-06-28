//
//  ZCCPhtotCollectionViewCell.m
//  MagicWallet
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCPhtotCollectionViewCell.h"

@interface ZCCPhtotCollectionViewCell()

@property (nonatomic, weak)UIButton *markBtn;

@property (nonatomic, assign)BOOL formalSelectedStatus;

@end

@implementation ZCCPhtotCollectionViewCell

- (void)prepareForReuse{
    
    [super prepareForReuse];
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
    }
    return self;
}

- (void)setPhotoImage:(UIImage *)photoImage{
    
    _photoImage = photoImage;
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.image = photoImage;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    [self addSubview:_imageView];
    
    UIButton *markBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 25, 0, 25, 25)];
    [markBtn setImage:[UIImage imageNamed:@"gift_choose_cancel"] forState:UIControlStateNormal];
    [markBtn setImage:[UIImage imageNamed:@"gift_choose_done"] forState:UIControlStateSelected];
//    [markBtn addTarget:self action:@selector(markBtnSelected) forControlEvents:UIControlEventTouchUpInside];
    self.markBtn = markBtn;
    markBtn.userInteractionEnabled = NO;
    [self addSubview:markBtn];
    
}

- (void)setSelected:(BOOL)selected{

    [super setSelected:selected];
    
    
    
    if(_formalSelectedStatus && selected){
        selected = NO;
    }
//    NSLog(@"选中状态%d",selected);
    
    _formalSelectedStatus = selected;
    
    if(selected){
        _markBtn.selected = YES;
        
        if([self.delegate respondsToSelector:@selector(selectedImage)]){
            [self.delegate selectedImage:self.imageView.image];
        }
        
    }else{
        _markBtn.selected = NO;
    }

}



@end
