//
//  RecordViewController.h
//  Combination
//
//  Created by Ruby on 14-6-19.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface RecordViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *freeModelView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *modelSelectSeg;
@property (weak, nonatomic) IBOutlet UIView *buttonBar;
@property (weak, nonatomic) IBOutlet UIView *followModelView;

- (IBAction)clickModelSelect:(id)sender;

@end
