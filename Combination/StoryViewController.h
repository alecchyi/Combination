//
//  StoryViewController.h
//  Combination
//
//  Created by Ruby on 14-6-6.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UIRoundedImageView.h"
#import "CategoryView.h"

@interface StoryViewController : BaseViewController<CategoryViewChooseDataDataSource,CategoryViewChooseDataDelegate> {
    NSMutableDictionary *story;
}


@property (weak, nonatomic) IBOutlet CategoryView *categoryView;
@property (weak, nonatomic) IBOutlet UIView *storyContentView;

@property (weak, nonatomic) IBOutlet UIRoundedImageView *praiseImgView;
@property (weak, nonatomic) IBOutlet UIRoundedImageView *userImgView;
@property (weak, nonatomic) IBOutlet UIRoundedImageView *shareImgView;
@property (weak, nonatomic) IBOutlet UIRoundedImageView *speakImgView;

@property (nonatomic,retain) NSMutableDictionary *story;

- (IBAction)clickRecordBtn:(id)sender;

@end
