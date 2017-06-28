//
//  ZCCClearCacheTool.m
//  MagicWallet
//
//  Created by mac on 2017/6/26.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCClearCacheTool.h"

@implementation ZCCClearCacheTool

+ (NSString *)getCacheSizeWithFilePath:(NSString *)path{
    
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    NSString *filePath = nil;
    
    NSInteger totalSize = 0;
    
    for(NSString *subPath in subPathArr){
        
//        拼接每一个文件的全路径
        filePath = [path stringByAppendingPathComponent:subPath];
        
        BOOL isDirectory = NO;
        
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        if(!isExist || isDirectory || [filePath containsString:@".DS"]){
            //过滤 1.文件夹不存在 2.过滤文件夹  3、隐藏文件
            continue;
        }
        
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        
        //
        totalSize += size;
        
    }
    
    NSString *totalStr = @"";
    
    if(totalSize > 1024 * 1024){
        totalStr = [NSString stringWithFormat:@"%.2fM",  totalSize / 1024.00f / 1024.00f];
    }else if (totalSize > 1000){
        totalStr = [NSString stringWithFormat:@"%.2fk",totalSize / 1024.00f];
    }else{
        totalStr = [NSString stringWithFormat:@"%.2fB",totalSize /1.00f];
    }
    return totalStr;
}

+ (BOOL)clearCacheWithFilePath:(NSString *)path{
    
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSString *filePath = nil;
    
    NSError *error = nil;
    
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingPathComponent:subPath];
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        
        if(error){
            return NO;
        }
    }
    
    return YES;
}


@end
