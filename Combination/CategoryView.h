//
//  CategoryView.h
//  Combination
//
//  Created by Ruby on 14-6-17.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SECTION_BTN_TAG_BEGIN   1000
#define SECTION_IV_TAG_BEGIN    3000

@protocol CategoryViewChooseDataDelegate <NSObject>

@optional

- (void)chooseAtSection:(NSInteger)section index:(NSInteger)index;


@end

@protocol CategoryViewChooseDataDataSource <NSObject>

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index;
- (NSInteger)defaultShowInSection:(NSInteger)section;

@end
@interface CategoryView : UIView<UITableViewDataSource,UITableViewDelegate>{
    NSInteger currentExtendSection;
}

@property (nonatomic,assign) id<CategoryViewChooseDataDelegate> categoryDelegate;
@property (nonatomic,assign) id<CategoryViewChooseDataDataSource> categoryDataSource;

@property (nonatomic, strong) UIView *mSuperView;
@property (nonatomic,strong) UIView *mTableBaseView;
@property (nonatomic,strong) UITableView *mTableView;

- (id)initWithFrame:(CGRect)frame dataSource:(id)datasource delegate:(id)delegate;
- (void)setTitle:(NSString *)title inSection:(NSInteger)section;

- (BOOL)isShow;
- (void)hiddenExtendedChooseView;

@end
