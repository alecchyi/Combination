//
//  RecordViewController.m
//  Combination
//
//  Created by Ruby on 14-6-19.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "RecordViewController.h"
#import "LocalStoreViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController
@synthesize story;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)leftBtnTap:(id)sender{
    LocalStoreViewController *storageView = [[LocalStoreViewController alloc] initWithNibName:NSStringFromClass([LocalStoreViewController class]) bundle:nil];
    storageView.title = @"本地录音文件";
    [self.navigationController pushViewController:storageView animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"讲故事";
    [self.modelSelectSeg addTarget:self action:@selector(clickModelSelect:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Storage" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnTap:)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    [self initStory];
}

- (void)initStory {
    self.story = [[DataService shareDataService].stories objectAtIndex:0];
    self.lblTitle.text = [self.story objectForKey:@"title"];
    self.lblTime.text = [NSString stringWithFormat:@"大约需要%@秒",[self.story objectForKey:@"times"]];
    self.storyContentView.text = [self.story objectForKey:@"content"];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickModelSelect:(id)sender {

    
    UISegmentedControl *segBtn = (UISegmentedControl *)sender;
    if (segBtn.selectedSegmentIndex == 0) {
        self.followModelView.hidden = NO;
        self.freeModelView.hidden = YES;
    }else if (segBtn.selectedSegmentIndex == 1){
        self.followModelView.hidden = YES;
        self.freeModelView.hidden = NO;
    }
    
}
@end
