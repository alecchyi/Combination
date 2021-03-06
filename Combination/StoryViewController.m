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
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "ReflectionView.h"
#import "RecordViewController.h"
//#import "DataService.h"

@interface StoryViewController (){
    NSMutableArray *categoriesArr;
}

@end


@implementation StoryViewController

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
    [(AppDelegate *)[UIApplication sharedApplication].delegate showRootView];
}

- (void)viewDidLoad
{
    self.btnType = @"story";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Story";
    [self initStoryData];
    [self setupRightMenuButton];
    [self setupCategoryView];
    [self setupStoryContentView];
    [self setupOperationView];
}

- (void)initStoryData {
    NSString *plist = [Utils storyPlistPath];
    plist = [[NSBundle mainBundle] pathForResource:@"stories" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plist];
    [DataService shareDataService].stories = [data objectForKey:@"stories"];
    self.story = [[DataService shareDataService].stories objectAtIndex:0];
}

- (void)setupOperationView {
    UITapGestureRecognizer *speakTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickSpeakBtn:)];
    self.speakImgView.userInteractionEnabled = YES;
    [self.speakImgView addGestureRecognizer:speakTap];
    
}

- (void)setupStoryContentView {
    UIView *storyView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 500, 400)];
    UIImage *bgImg = [UIImage imageNamed:@"head_8.png"];
//    storyView.layer.contents = (id)bgImg.CGImage;
    ReflectionView *flectionView = [[ReflectionView alloc] initWithFrame:CGRectMake(0, 0, 500, 280)];
    UIImageView *flectImgView = [[UIImageView alloc] initWithFrame:flectionView.frame];
    flectImgView.image = bgImg;
    [flectionView addSubview:flectImgView];
    flectionView.reflectionAlpha = 0.5f;
    flectionView.reflectionGap = 5;
    flectionView.reflectionScale = 0.4f;
    [storyView addSubview:flectionView];
    CGRect frame = CGRectMake(200, 330, 300, 50);
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:frame];
    lblTitle.text = [self.story objectForKey:@"title"];
    lblTitle.font = [UIFont systemFontOfSize:20.0f];
    [storyView addSubview:lblTitle];
    frame.origin.x = 30;
    frame.size.width = 150;
    UILabel *lblTime = [[UILabel alloc] initWithFrame:frame];
    lblTime.text = [NSString stringWithFormat:@"00:00 / %@", [Utils convertTime:[self.story objectForKey:@"times"]]];
    lblTime.font = [UIFont systemFontOfSize:24.0f];
    [storyView addSubview:lblTime];
    frame.origin.x = 450;
    frame.origin.y = 230;
    frame.size.width = 50;
    frame.size.height = 50;
    UIButton *btnPlay = [[UIButton alloc] initWithFrame:frame];
    [btnPlay setBackgroundImage:[UIImage imageNamed:@"pause_btn.png"] forState:UIControlStateNormal];
    [storyView addSubview:btnPlay];
    [self.storyContentView addSubview:storyView];
    
    UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(600, 0, 400, 410)];
    contentView.editable = NO;
    [contentView setBackgroundColor:[UIColor lightGrayColor]];
    contentView.text = [self.story objectForKey:@"content"];
    contentView.font = [UIFont systemFontOfSize:16.0f];
    [self.storyContentView addSubview:contentView];
}

- (void)setupCategoryView {
    categoriesArr = [NSMutableArray arrayWithArray:@[
                                                     @[@"流行",@"冒险",@"鬼怪",],
                                                     @[@"方言",@"大连话",@"河南话",],
                                                     @[@"年龄",@"3-6",@"7-10",]
                                                     ]];
    CategoryView *catesView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 20, self.categoryView.frame.size.width, 70) dataSource:self delegate:self];
    catesView.mSuperView = self.storyContentView;
//    self.categoryView = catesView;
    [self.categoryView addSubview:catesView];
    NSLog(@"%d",30);
    NSLog(@"%.f",20.3f);
    NSLog(@"%@",@"ruby");
}

- (void)setupRightMenuButton {
    MMDrawerBarButtonItem *rightBtnItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightBtnPress:)];
    [self.navigationItem setRightBarButtonItem:rightBtnItem animated:YES];
}

- (void)rightBtnPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (NSInteger)numberOfSections{
    return [categoriesArr count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = categoriesArr[section];
    return [arr count];
}

- (NSString *)titleInSection:(NSInteger)section index:(NSInteger)index{
    NSArray *arr = categoriesArr[section];
    return arr[index];
}

- (NSInteger)defaultShowInSection:(NSInteger)section{
    return 0;
}

- (void)chooseAtSection:(NSInteger)section index:(NSInteger)index{
    
}

- (void)clickSpeakBtn:(id)sender {
    RecordViewController *recordViewController = [[RecordViewController alloc] initWithNibName:NSStringFromClass([RecordViewController class]) bundle:nil];
    [self.navigationController pushViewController:recordViewController animated:YES];
    
}

- (IBAction)clickRecordBtn:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
