//
//  ZCCMineListTableViewCell.m
//  MagicWallet
//
//  Created by mac on 2017/6/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCMineListTableViewCell.h"
#import "ZCCCommon.h"

@implementation ZCCMineListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.height - 20)/2, 20, 20)];
        self.iconView = imageView;
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 0, 100, 44)];
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        //celld大概高30
        UILabel *detialLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50 - 35, (self.height - 24)/2, 48, 24)];
        detialLabel.font = [UIFont systemFontOfSize:12];
        detialLabel.textAlignment = NSTextAlignmentRight;
        detialLabel.numberOfLines = 0;
        self.contentLabel = detialLabel;
        [self addSubview:detialLabel];
        
    }
    return self;
}

- (void)setDic:(NSDictionary *)dic{
    
    _dic = dic;
    
}

@end
