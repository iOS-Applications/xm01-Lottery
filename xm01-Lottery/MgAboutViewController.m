//
//  MgAboutViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/23.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgAboutViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingGroup.h"

@interface MgAboutViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation MgAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] init];
    
    MgSettingItem *mark = [MgSettingArrowItem itemWithTitle:@"评分支持" destVcClass:nil];
    mark.option = ^{
        NSString *appid = @"725296055";
        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        NSURL *url = [NSURL URLWithString:str];
        [[UIApplication sharedApplication] openURL:url];
    };
    
    MgSettingItem *call = [MgSettingArrowItem itemWithTitle:@"客服电话" destVcClass:nil];
    call.subtitle = @"10086";
    call.option = ^{
        NSURL *url = [NSURL URLWithString:@"tell://10086"];
//        NSURL *url = [NSURL URLWithString:@"telprompt://10086"];
//        [[UIApplication sharedApplication] openURL:url];
        
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = @[mark, call];
    
    [self.data addObject:group];
    
    // header
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
}
@end
