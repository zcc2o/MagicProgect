//
//  ZCCPhtotCollectionViewCell.h
//  MagicWallet
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZCCSelectedPhotoImageDelegate <NSObject>

- (void)selectedImage:(UIImage *)image;

@end

@interface ZCCPhtotCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImage *photoImage;

@property (nonatomic, strong)NSString *markImageStr;

@property (nonatomic, strong)UIImageView *imageView;

//@property (nonatomic, assign)BOOL selected;

@property (nonatomic, strong)id <ZCCSelectedPhotoImageDelegate>delegate;

@end
