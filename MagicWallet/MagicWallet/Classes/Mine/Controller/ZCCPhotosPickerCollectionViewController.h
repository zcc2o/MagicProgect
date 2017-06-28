//
//  ZCCPhotosPickerCollectionViewController.h
//  MagicWallet
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RealIdentifierPickersDelegate <NSObject>

- (void)thePictureIDcard:(UIImage *)image andCellNumber:(NSInteger)cellNumber;

@end

@interface ZCCPhotosPickerCollectionViewController : UICollectionViewController

@property (nonatomic, strong)id <RealIdentifierPickersDelegate>delegate;

@property (nonatomic, assign)NSInteger cellNumber;

@end
