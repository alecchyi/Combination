//
//  RecordViewController.h
//  Combination
//
//  Created by Ruby on 14-6-19.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface RecordViewController : BaseViewController {
    NSMutableDictionary *story;
}

@property (nonatomic,retain) NSMutableDictionary *story;

@property (weak, nonatomic) IBOutlet UIView *freeModelView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *modelSelectSeg;
@property (weak, nonatomic) IBOutlet UIView *buttonBar;
@property (weak, nonatomic) IBOutlet UIView *followModelView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak,nonatomic) IBOutlet UITextView *storyContentView;
@property (weak,nonatomic) IBOutlet UILabel *lblTime;

- (IBAction)clickModelSelect:(id)sender;

@end
