//
//  LoginViewController.m
//  Combination
//
//  Created by Ruby on 14-6-6.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@dynamic loginBtn;

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
    // Do any additional setup after loading the view from its nib.
  //  NSString *title = [[NSString string] initWithString:@"Demos"];
    self.title = @"请登录";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLoginBtn:(UIButton *)btn{
    NSLog(@"login");
}

@end
