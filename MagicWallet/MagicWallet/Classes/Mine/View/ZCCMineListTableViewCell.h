//
//  ZCCMineListTableViewCell.h
//  MagicWallet
//
//  Created by mac on 2017/6/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCMineListTableViewCell : UITableViewCell

@property (nonatomic, copy)NSDictionary *dic;

@property (nonatomic, strong)UIImageView *iconView;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UILabel *contentLabel;

@end
