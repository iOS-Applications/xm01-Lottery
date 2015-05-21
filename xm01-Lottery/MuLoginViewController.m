//
//  MuLoginViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/26.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MuLoginViewController.h"
#import "UIImage+Extension.h"

#import "MgSettingViewController.h"

@interface MuLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)setting;

@end

@implementation MuLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *norm = [UIImage resizableImage:@"RedButton"];
    UIImage *hight = [UIImage resizableImage:@"RedButtonPressed"];
    
    [self.loginBtn setBackgroundImage:norm forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:hight forState:UIControlStateHighlighted];
    
}


- (IBAction)setting{
    MgSettingViewController *settingVC = [[MgSettingViewController alloc] init];
//    settingVC.title = @"设置";
    [self.navigationController pushViewController:settingVC animated:YES];
}
@end
