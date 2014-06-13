//
//  StoryViewController.m
//  Combination
//
//  Created by Ruby on 14-6-6.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "StoryViewController.h"
#import "PortalViewController.h"
#import "AppDelegate.h"

@interface StoryViewController ()

@end

@implementation StoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)leftBtnTap:(id)sender{
    [(AppDelegate *)[UIApplication sharedApplication].delegate showRootView];
}

- (void)viewDidLoad
{
    self.btnType = @"story";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Story";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
