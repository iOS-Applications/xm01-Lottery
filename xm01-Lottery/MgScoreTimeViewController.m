//
//  MgScoreTimeViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//
// 比赛直播控制器

#import "MgScoreTimeViewController.h"
#import "MgSettingLabelItem.h"
#import "MgSettingSwitchItem.h"
#import "MgSettingGroup.h"


@interface MgScoreTimeViewController ()

@end

@implementation MgScoreTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 0组
    MgSettingItem *notice = [MgSettingSwitchItem itemWithIcon:nil title:@"提醒我关注的比赛"];
    MgSettingGroup *group0 = [[MgSettingGroup alloc] init];
    group0.items = @[notice];
    group0.footer = @"当我关注的比赛比分发什么变化时，通过小弹窗或推送进行提醒";
    [self.data addObject:group0];
    
    // 1组
    MgSettingItem *startTime = [MgSettingLabelItem itemWithIcon:nil title:@"提醒我关注的比赛"];
    MgSettingGroup *group1 = [[MgSettingGroup alloc] init];
    group1.items = @[startTime];
    group1.header = @"只在以下时间接受比分直播";
    [self.data addObject:group1];
    
    // 2组
    MgSettingItem *endTime = [MgSettingLabelItem itemWithIcon:nil title:@"提醒我关注的比赛"];
    MgSettingGroup *group2 = [[MgSettingGroup alloc] init];
    group2.items = @[endTime];
    [self.data addObject:group2];
}

@end
