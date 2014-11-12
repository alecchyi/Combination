//
//  DataService.m
//  Combination
//
//  Created by Ruby on 14-7-15.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "DataService.h"

@implementation DataService

@synthesize menuList;

-(id)init{
    if(self = [super init]){
        self.menuList = [NSMutableArray array];
        self.stories = [NSMutableArray array];
    }
    return self;
}

+(DataService *)shareDataService{
    static dispatch_once_t once;
    static DataService *dataService = nil;
    
    dispatch_once(&once, ^{
        dataService = [[super alloc] init];
    });
    return dataService;
}

@end
