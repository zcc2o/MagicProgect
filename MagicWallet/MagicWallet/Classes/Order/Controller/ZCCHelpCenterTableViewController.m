//
//  ZCCHelpCenterTableViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCHelpCenterTableViewController.h"
#import "ZCCCommon.h"
@interface ZCCHelpCenterTableViewController ()

@property (nonatomic, assign)BOOL cellSelected;

@end

@implementation ZCCHelpCenterTableViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帮助中心";
    
    self.tableView.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"iCould账号怎么获取？";
            break;
        case 1:
            cell.textLabel.text = @"iCould账号怎么替换？";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            _cellSelected = !_cellSelected;
            [self.tableView reloadData];
//            [self.tableView layoutIfNeeded];
        }
            break;
        case 1:
        {
            //显示一个webView
        }
            break;
            
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        
        UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        labelView.backgroundColor = ZCCRGBColor(240, 240, 240, 1.0);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, 150, 27)];
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"猜您遇到了以下问题";
        label.textColor = [UIColor grayColor];
        [labelView addSubview:label];
        
        return labelView;
    }else{
        return nil;
    }
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREENWIDTH, 50)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREENWIDTH - 20, 50)];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        [footView addSubview:label];
        
        label.text = @"答： 初审通过后，系统下发iCould账号和密码，您可以在借款订单详细页面查看账号，获取后请及时替换账号！ 借款结束后也会下发账号密码给用户解释";
        return footView;
    }else{
        return nil;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 35;
            break;
        case 1:
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
        {
            return _cellSelected ? 50 : 0;
        }
            break;
        case 1:
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}

@end
