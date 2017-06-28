//
//  ZCCSettingTableViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCSettingTableViewController.h"
#import "ZCCClearCacheTool.h"
#import "ProgressHUD.h"
#import "ZCCCommon.h"
@interface ZCCSettingTableViewController ()

@property (nonatomic, strong)NSString *cacheSizeStr;

@end

static NSString * const reuseIdentifier = @"Cell";

@implementation ZCCSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"user_bg_MoFaQianBao"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.alpha = 1;
    
    [self getCacheSize];
    
    [self addView];
    
}

- (void)addView{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 1)];
    view.backgroundColor = ZCCRGBColor(230, 230, 230, 1.0);
    
    self.tableView.tableFooterView = view;
    
    self.tableView.separatorColor = ZCCRGBColor(230, 230, 230, 1.0);
    
}

- (void)getCacheSize{
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    self.cacheSizeStr = [ZCCClearCacheTool getCacheSizeWithFilePath:cachePath];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case 0:
        {
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            
            
            cell.imageView.image = [UIImage imageNamed:@"pic_update"];
            cell.textLabel.text = @"当前版本";
            cell.detailTextLabel.text = app_Version;
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        case 1:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_delete"];
            cell.textLabel.text = @"清理缓存";
            cell.detailTextLabel.text = self.cacheSizeStr;
        }
            break;
        case 2:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_help"];
            cell.textLabel.text = @"帮助中心";
            cell.detailTextLabel.text = @"";
        }
            break;
        case 3:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_about"];
            cell.textLabel.text = @"关于我们";
            cell.detailTextLabel.text = @"";
        }
            break;
        case 4:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_feedback"];
            cell.textLabel.text = @"联系我们";
            cell.detailTextLabel.text = @"0574-12345678";
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
            if([ZCCClearCacheTool clearCacheWithFilePath:cachePath]){
                [ProgressHUD showSuccess:@"清除成功"];
                
                cell.detailTextLabel.text = [ZCCClearCacheTool getCacheSizeWithFilePath:cachePath];
                
            }else{
                [ProgressHUD showError:@"清除失败"];
            }
        }
            break;
        case 2:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_help"];
            cell.textLabel.text = @"帮助中心";
            cell.detailTextLabel.text = @"";
        }
            break;
        case 3:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_about"];
            cell.textLabel.text = @"关于我们";
            cell.detailTextLabel.text = @"";
        }
            break;
        case 4:
        {
            cell.imageView.image = [UIImage imageNamed:@"pic_setting_feedback"];
            cell.textLabel.text = @"联系我们";
            cell.detailTextLabel.text = @"0574-12345678";
        }
            break;
            
        default:
            break;
    }
    
}

@end
