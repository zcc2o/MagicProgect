//
//  ZCCClearCacheTool.h
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCClearCacheTool : NSObject

/*
 获取path路径下文件夹大小
 
 @param path 要获取的文件夹路径
 
 @param return 返回path路径下文件夹的大小
 
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;


/*
 清除path路径下文件夹的缓存
 
 @param path 要清楚缓存文件夹路径
 
 @ return 是否清除成功
 
 */

+ (BOOL)clearCacheWithFilePath:(NSString *)path;

@end
