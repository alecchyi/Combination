//
//  UIRoundedImageView.m
//  Combination
//
//  Created by Ruby on 14-6-13.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "UIRoundedImageView.h"

@implementation UIRoundedImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)willMoveToWindow:(UIWindow *)newWindow{
    CALayer *roundedLayer = [self layer];
    [roundedLayer setMasksToBounds:YES];
    roundedLayer.cornerRadius = 30;
    roundedLayer.borderColor = [[UIColor grayColor] CGColor];
}

@end
