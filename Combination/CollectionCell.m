//
//  CollectionCell.m
//  Combination
//
//  Created by Ruby on 14-6-9.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrays = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        if (arrays.count < 1 ) {
            return nil;
        }
        if (![[arrays objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrays objectAtIndex:0];
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

@end
