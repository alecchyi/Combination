//
//  Utils.m
//  Combination
//
//  Created by Alec on 14/11/12.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)storyPlistPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = kStoryList;
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:filePath];
    if(!success){
        NSMutableArray* dic = [NSMutableArray array];
        [dic writeToFile:filePath atomically:YES];
    }
    return filePath;
}

@end