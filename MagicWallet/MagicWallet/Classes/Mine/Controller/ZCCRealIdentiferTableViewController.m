//
//  ZCCRealIdentiferTableViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/21.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCRealIdentiferTableViewController.h"
#import "ZCCIdentifierTableViewCell.h"
#import "ZCCCommon.h"
#import "NSString+EXTENSION.h"
#import "ZCCPhotosPickerCollectionViewController.h"

@interface ZCCRealIdentiferTableViewController()<RealIdentifierPickersDelegate>

@end

@implementation ZCCRealIdentiferTableViewController

static NSString *cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"user_bg_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.alpha = 1;
    
    self.tableView.backgroundColor = ZCCRGBColor(235, 235, 235, 1.0);
    
    self.title = @"实名认证";
    
    [self addTableFootView];
    
//    self.tableView = [self.tableView initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

- (void)viewWillappear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
    
}

- (void)addTableFootView{
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 95)];
    
    UILabel *labelRed = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 15, 13)];
    labelRed.text = @"注:";
    labelRed.font = [UIFont systemFontOfSize:11];
    labelRed.textColor = [UIColor redColor];
    
    NSString *str1 = @"认证审核时间：早上9：00-12：00";
    CGSize str1Size = [str1 sizewithFont:[UIFont systemFontOfSize:11] andMaxSize:CGSizeMake(MAXFLOAT, 11)];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5 + 15 + 1, 5, str1Size.width, 13)];
    label1.text = str1;
    label1.font = [UIFont systemFontOfSize:11];
    
    NSString *str2 = @"下午12：30-18：00，如有疑问请联系客服";
    CGSize str2Size = [str2 sizewithFont:[UIFont systemFontOfSize:11] andMaxSize:CGSizeMake(MAXFLOAT, 11)];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 5, CGRectGetMaxY(label1.frame) + 2, str2Size.width, 13)];
    label2.text = str2;
    label2.font = [UIFont systemFontOfSize:11];
    
    [footView addSubview:labelRed];
    [footView addSubview:label1];
    [footView addSubview:label2];
    
    //提交审核按钮
    UIButton *upDate = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(label2.frame) + 25, SCREENWIDTH - 40, 30)];
    [upDate setTitle:@"提交审核" forState:UIControlStateNormal];
    [upDate setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    upDate.titleLabel.font = [UIFont systemFontOfSize:14];
    [upDate setBackgroundColor:ZCCRGBColor(87, 174, 214, 1.0)];
    upDate.layer.cornerRadius = 3;
    upDate.layer.masksToBounds = YES;
    [footView addSubview:upDate];
    
    self.tableView.tableFooterView = footView;
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    {
                        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
                        cell.textLabel.text = @"当前账号";
                        cell.textLabel.font = [UIFont systemFontOfSize:12];
                        cell.detailTextLabel.text = @"15706844165";
                        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
                        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                        break;
                    }
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    {
                        ZCCIdentifierTableViewCell *cell = [[ZCCIdentifierTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        cell.itemName.text = @"真实姓名";
                        return cell;
                        break;
                    }
                case 1:
                    {
                        ZCCIdentifierTableViewCell *cell = [[ZCCIdentifierTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        cell.itemName.text = @"真实姓名";
                        return cell;
                        break;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    {
                        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//                        cell.imageView.image = [UIImage imageNamed:@"add_pic_btn"];
                        cell.imageView.size = CGSizeMake(60, 40);
                        cell.textLabel.text = @"二代身份证正面照片";
                        cell.textLabel.font = [UIFont systemFontOfSize:15];
                        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        
                        cell.imageView.image = [UIImage imageNamed:@"add_pic_btn"];
                        CGSize itemSize = CGSizeMake(60, 36);
                        UIGraphicsBeginImageContext(itemSize);
                        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
                        [cell.imageView.image drawInRect:imageRect];
                        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    }
                    break;
                case 1:
                    {
                        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//                        cell.imageView.image = [UIImage imageNamed:@"add_pic_btn"];
                        cell.imageView.size = CGSizeMake(60, 40);
                        cell.textLabel.text = @"二代身份证背面照片";
                        cell.textLabel.font = [UIFont systemFontOfSize:15];
                        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        
                        cell.imageView.image = [UIImage imageNamed:@"add_pic_btn"];
                        CGSize itemSize = CGSizeMake(60, 36);
                        UIGraphicsBeginImageContext(itemSize);
                        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
                        [cell.imageView.image drawInRect:imageRect];
                        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    }
                    break;
                case 2:
                    {
                        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];

                        cell.textLabel.text = @"手持二代身份证照片";
                        cell.detailTextLabel.text = @"要求；手持的身份证号码清晰，并且能看到手持人清晰的上半身照片";
                        cell.detailTextLabel.textColor = ZCCRGBColor(120, 120, 120, 1.0);
                        cell.detailTextLabel.numberOfLines = 0;
                        cell.textLabel.font = [UIFont systemFontOfSize:15];
                        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        
                        //更改图片大小
                        cell.imageView.image = [UIImage imageNamed:@"add_pic_btn"];
                        CGSize itemSize = CGSizeMake(60, 36);
                        UIGraphicsBeginImageContext(itemSize);
                        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
                        [cell.imageView.image drawInRect:imageRect];
                        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
                        UIGraphicsEndImageContext();
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return 0;
    
}

- (void)thePictureIDcard:(UIImage *)image andCellNumber:(NSInteger)cellNumber{
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:cellNumber inSection:2];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexpath];
    
    [cell.imageView setImage:image];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.0, 280, 30)];
    customView.backgroundColor = ZCCRGBColor(235, 235, 235, 1.0);
    
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headLabel.backgroundColor = [UIColor clearColor];
    headLabel.font = [UIFont systemFontOfSize:11];
    
    switch (section) {
        case 0:
            {
                headLabel.text =  @"你还未提交实名认证申请";
            }
            break;
        case 1:
            {
                headLabel.text = @"实名认证后倾按照步骤继续完善信息";
            }

            break;
        case 2:
            {
                headLabel.text = @"身份证照片";
                CGSize strSize = [headLabel.text sizewithFont:[UIFont systemFontOfSize:11] andMaxSize:CGSizeMake(MAXFLOAT, 30)];
                headLabel.width = strSize.width;
                
                UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10 + headLabel.width + 10, 0, 70,30)];
                label2.text = @"查看帮助?";
                label2.textColor = [UIColor blueColor];
                label2.font = [UIFont systemFontOfSize:11];
                [customView addSubview:label2];
            }

            break;
        default:
            break;
    }
    
    CGSize strSize = [headLabel.text sizewithFont:[UIFont systemFontOfSize:11] andMaxSize:CGSizeMake(MAXFLOAT, 30)];
    
    headLabel.frame = CGRectMake(10.0, 0, strSize.width, 30);
    
    [customView addSubview:headLabel];
    
    return customView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        case 1:
            return ;
            break;
        case 2:
            {
                ZCCPhotosPickerCollectionViewController *phtotPickserVC = [[ZCCPhotosPickerCollectionViewController alloc] init];
                phtotPickserVC.delegate = self;
                phtotPickserVC.cellNumber = indexPath.row;
                [self.navigationController pushViewController:phtotPickserVC animated:YES];
            }
            break;
        default:
            break;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        case 1:
            return 30.0;
            break;
        case 2:
            return 52.0;
            break;
        default:
            break;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tableView endEditing:YES];
}

@end
