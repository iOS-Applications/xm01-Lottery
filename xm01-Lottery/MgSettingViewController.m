//
//  MuSettingViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/4.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingSwitchItem.h"
#import "MgSettingGroup.h"
#import "MgSettingCell.h"
#import "MgPushNoticeViewController.h"
#import "MgProductViewController.h"
#import "MBProgressHUD+MJ.h"
#import "MgHelpViewController.h"
#import "MgShareViewController.h"
#import "MgAboutViewController.h"

@implementation MgSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1、标题
    self.title = @"设置";
    
    // 2、添加数据
    [self group0];
    [self group1];
}

// 第0组
- (void)group0
{
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    MgSettingItem *MorePush = [MgSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MgPushNoticeViewController class]];
    MgSettingItem *handShake = [MgSettingArrowItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    MgSettingItem *soundEffect = [MgSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    group.items = @[MorePush, handShake, soundEffect];
    //        group0.header = @"haha";
    //        group0.footer = @"这是第一组";
    
    [self.data addObject:group];
    
}

// 第1组
- (void)group1
{
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    MgSettingItem *MoreUpdate = [MgSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    MoreUpdate.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在检查新版本"];
#warning 发送网络请求
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    MgSettingItem *MoreHelp = [MgSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[MgHelpViewController class]];
    MgSettingItem *MoreShare = [MgSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[MgShareViewController class]];
    MgSettingItem *MoreMessage = [MgSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[MgPushNoticeViewController class]];
    MgSettingItem *MoreNetease = [MgSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[MgProductViewController class]];
    MgSettingItem *MoreAbout = [MgSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[MgAboutViewController class]];
    
    group.items = @[MoreUpdate, MoreHelp, MoreShare, MoreMessage, MoreNetease, MoreAbout];
    //        group1.header = @"enene";
    //        group1.footer = @"这是第二组";
    [self.data addObject:group];
}

@end


