//
//  DetailViewController.h
//  Combination
//
//  Created by Ruby on 14-5-26.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
