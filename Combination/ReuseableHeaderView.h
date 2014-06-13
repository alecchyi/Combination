//
//  ReuseableHeaderView.h
//  Combination
//
//  Created by Ruby on 14-6-10.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReuseableHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *headerBackImgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@end
