//
//  MgAwardAnimViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgAwardAnimViewController.h"
#import "MgSettingGroup.h"
#import "MgSettingSwitchItem.h"

@interface MgAwardAnimViewController ()

@end

@implementation MgAwardAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MgSettingItem *anim = [MgSettingSwitchItem itemWithIcon:nil title:@"双色球"];
    
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = @[anim];
    group.header = @"打开设置即可在开奖后立即收到推送消息,获知开奖号码";
    [self.data addObject:group];
    
}
@end
