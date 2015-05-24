//
//  MgShareViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/23.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgShareViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingGroup.h"


@interface MgShareViewController ()

@end

@implementation MgShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MgSettingItem *sina = [MgSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪分享" destVcClass:nil];
    MgSettingItem *sms = [MgSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享" destVcClass:nil];
    sms.option = ^{
        NSURL *url = [NSURL URLWithString:@"sms://10010"]; // short message
        [[UIApplication sharedApplication] openURL:url];
    };
    MgSettingItem *mail = [MgSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享" destVcClass:nil];
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = @[sina, sms, mail];
    
    [self.data addObject:group];

}


@end
