//
//  PortalViewController.m
//  Combination
//
//  Created by Ruby on 14-6-6.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

NSString *const MJCollectionViewCellIdentifier = @"CollectionCell";

#import "PortalViewController.h"
#import "CollectionCell.h"
#import "ReuseableHeaderView.h"
#import "StoryViewController.h"

@interface PortalViewController ()

@end

@implementation PortalViewController

@synthesize collectionView, titleItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"init");
    [self setupCollectView];
}

- (void)setupCollectView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(230.0f, 230.0f);
    layout.sectionInset = UIEdgeInsetsMake(30, 30, 30, 30);
    layout.minimumInteritemSpacing = 30;
    layout.minimumLineSpacing = 30;
    layout.headerReferenceSize = CGSizeMake(1024.0f, 80.0f);
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor blackColor];
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
    UINib *headerNib = [UINib nibWithNibName:NSStringFromClass([ReuseableHeaderView class]) bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    NSArray *titles = [NSArray arrayWithObjects:@"记事",@"故事会",@"音乐",@"新闻",@"天气",@"画板", nil];
    self.titleItems = titles;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.titleItems count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionV viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        ReuseableHeaderView *headerView = [collectionV dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//        headerView.lblTitle.text = @"Combination";
//        UIImage *headerImg = [UIImage imageNamed:@"head_2.png"];
//        headerView.headerBackImgView.image = headerImg;
        reuseableView = headerView;
    }
    return reuseableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionV cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionCell *cell = (CollectionCell *)[collectionV dequeueReusableCellWithReuseIdentifier:MJCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *imgName = [NSString stringWithFormat:@"head_%d.png", indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.lblTitle.text = [self.titleItems objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        StoryViewController *storyViewController = [[StoryViewController alloc] init];
        UINavigationController *mainNavController = [[UINavigationController alloc] initWithRootViewController:storyViewController];
        self.view.window.rootViewController = mainNavController;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
