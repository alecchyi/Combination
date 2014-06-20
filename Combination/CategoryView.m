//
//  CategoryView.m
//  Combination
//
//  Created by Ruby on 14-6-17.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "CategoryView.h"

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians)*(180.0/M_PI))

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame dataSource:(id)datasource delegate:(id)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        currentExtendSection = -1;
        self.categoryDataSource = datasource;
        self.categoryDelegate = delegate;
        
        NSInteger sectionNum = 0;
        if ([self.categoryDataSource respondsToSelector:@selector(numberOfSections)]) {
            sectionNum = [self.categoryDataSource numberOfSections];
        }
        if (sectionNum == 0) {
            self = nil;
        }
        
        //init view
        CGFloat sectionWidth = (1.0 * (frame.size.width/sectionNum));
        for (int i=0; i<sectionNum; i++) {
            UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(sectionWidth * i, 1, sectionWidth, frame.size.height - 2)];
            sectionBtn.tag = SECTION_BTN_TAG_BEGIN + i;
            [sectionBtn addTarget:self action:@selector(sectionBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
            NSString *btnTitle = @"--";
            if ([self.categoryDataSource respondsToSelector:@selector(titleInSection:index:)]) {
                btnTitle = [self.categoryDataSource titleInSection:i index:[self.categoryDataSource defaultShowInSection:i]];
            }
            [sectionBtn setTitle:btnTitle forState:UIControlStateNormal];
            [sectionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            sectionBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
            [self addSubview:sectionBtn];
            
            UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(sectionWidth*i+sectionWidth - 16, (self.frame.size.height-12)/2, 12, 12)];
            [arrowImg setImage:[UIImage imageNamed:@"down_dark.png"]];
            [arrowImg setContentMode:UIViewContentModeScaleAspectFill];
            arrowImg.tag = SECTION_IV_TAG_BEGIN + i;
            [self addSubview:arrowImg];
            
            
        }
        
    }
    return self;
}

- (void)sectionBtnTouched:(UIButton *)sender {
    NSInteger section = sender.tag - SECTION_BTN_TAG_BEGIN;
    UIImageView *currentArrow = (UIImageView *)[self viewWithTag:(SECTION_IV_TAG_BEGIN + currentExtendSection)];
    [UIView animateWithDuration:0.3 animations:^{
        currentArrow.transform = CGAffineTransformRotate(currentArrow.transform, DEGREES_TO_RADIANS(180));
    }];
    
    if (currentExtendSection == section) {
        [self hiddenExtendedChooseView];
    }else{
        currentExtendSection = section;
        currentArrow = (UIImageView *)[self viewWithTag:(SECTION_IV_TAG_BEGIN + currentExtendSection)];
        [UIView animateWithDuration:0.3 animations:^{
            currentArrow.transform = CGAffineTransformRotate(currentArrow.transform, DEGREES_TO_RADIANS(180));
        }];
        
        [self showChooseListViewInSection:currentExtendSection choosedIndex:[self.categoryDataSource defaultShowInSection:currentExtendSection]];
    }
}

- (void)setTitle:(NSString *)title inSection:(NSInteger)section{
    UIButton *btn = (id)[self viewWithTag:(SECTION_BTN_TAG_BEGIN + section)];
    [btn setTitle:title forState:UIControlStateNormal];
}

- (BOOL)isShow{
    if (currentExtendSection == -1) {
        return NO;
    }
    return YES;
}

- (void)hiddenExtendedChooseView{
    if (currentExtendSection!=-1) {
        currentExtendSection = -1;
        CGRect rect = self.mTableView.frame;
        rect.size.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.mTableBaseView.alpha = 1.0f;
            self.mTableView.alpha = 1.0f;
            self.mTableBaseView.alpha = 0.2f;
            self.mTableView.alpha = 0.2f;
            
            self.mTableView.frame = rect;
        } completion:^(BOOL finished){
            [self.mTableView removeFromSuperview];
            [self.mTableBaseView removeFromSuperview];
        }];
    }
}

- (void)showChooseListViewInSection:(NSInteger)section choosedIndex:(NSInteger)index {
    if (!self.mTableView) {
        self.mTableBaseView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height , self.frame.size.width, self.mSuperView.frame.size.height - self.frame.origin.y - self.frame.size.height)];
        self.mTableBaseView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0];
        
        UITapGestureRecognizer *bgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction:)];
        [self.mTableBaseView addGestureRecognizer:bgTap];
        
        self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 240) style:UITableViewStylePlain];
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
    }
    
    //修改tableview的frame
    int sectionWidth = (self.frame.size.width)/[self.categoryDataSource numberOfSections];
    CGRect rect = self.mTableView.frame;
    rect.origin.x = sectionWidth * section;
    rect.size.width = sectionWidth;
    rect.size.height = 0;
    rect.origin.y = 0;
    self.mTableView.frame = rect;
    [self.mSuperView addSubview:self.mTableBaseView];
    [self.mSuperView addSubview:self.mTableView];
    
    //动画设置位置
    rect .size.height = 240;
    [UIView animateWithDuration:0.3 animations:^{
        self.mTableBaseView.alpha = 0.2;
        self.mTableView.alpha = 0.2;
        
        self.mTableBaseView.alpha = 1.0;
        self.mTableView.alpha = 1.0;
        self.mTableView.frame =  rect;
    }];
    [self.mTableView reloadData];
}

-(void)bgTappedAction:(UITapGestureRecognizer *)tap
{
    UIImageView *currentIV = (UIImageView *)[self viewWithTag:(SECTION_IV_TAG_BEGIN + currentExtendSection)];
    [UIView animateWithDuration:0.3 animations:^{
        currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
    }];
    
    [self hiddenExtendedChooseView];
}
#pragma mark -- UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.categoryDelegate respondsToSelector:@selector(chooseAtSection:index:)]) {
        NSString *chooseCellTitle = [self.categoryDataSource titleInSection:currentExtendSection index:indexPath.row];
        NSLog(@"eeeeee");
        UIButton *currentSectionBtn = (UIButton *)[self viewWithTag:SECTION_BTN_TAG_BEGIN + currentExtendSection];
        [currentSectionBtn setTitle:chooseCellTitle forState:UIControlStateNormal];
        
        [self.categoryDelegate chooseAtSection:currentExtendSection index:indexPath.row];
        [self hiddenExtendedChooseView];
    }else{
        NSLog(@"sssss");
    }
}

#pragma mark -- UITableView DataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categoryDataSource numberOfRowsInSection:currentExtendSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [self.categoryDataSource titleInSection:currentExtendSection index:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
