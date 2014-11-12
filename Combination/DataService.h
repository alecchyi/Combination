//
//  DataService.h
//  Combination
//
//  Created by Ruby on 14-7-15.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject{
    NSMutableArray *menuList;
}

@property (nonatomic,strong) NSMutableArray *menuList;
@property (nonatomic,strong) NSMutableArray *stories;

+(DataService *)shareDataService;

@end
