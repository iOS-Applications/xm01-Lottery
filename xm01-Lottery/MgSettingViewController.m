//
//  MuSettingViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/4.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingViewController.h"
#import "MgSettingItem.h"
#import "MgSettingGroup.h"
#import "MgPushNoticeViewController.h"
#import "MgSettingCell.h"


@interface MgSettingViewController ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation MgSettingViewController

// 懒加载
- (NSMutableArray *)data
{
    if (_data == nil) {
        
        _data = [NSMutableArray array];
        // 0组
        MgSettingGroup *group0 = [[MgSettingGroup alloc] init];
        MgSettingItem *item00 = [MgSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MgPushNoticeViewController class]];
        MgSettingItem *item01 = [MgSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MgPushNoticeViewController class]];
        group0.items = @[item00, item01];
        group0.header = @"haha";
        group0.footer = @"这是第一组";
        
        [_data addObject:group0];
        
        // 1组
        MgSettingGroup *group1 = [[MgSettingGroup alloc] init];
        MgSettingItem *item10 = [MgSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MgPushNoticeViewController class]];
        group1.items = @[item00, item10];
        group1.header = @"enene";
        group1.footer = @"这是第二组";
        [_data addObject:group1];

    }
    return _data;
}
// init出来的都是Group样式，封装起来
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

# pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MgSettingGroup *group = self.data[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1、创建cell
    MgSettingCell *cell = [MgSettingCell cellWithTableView:tableView];
    // 2、给cell传递模型数据
//    MgSettingItem *item = self.data[indexPath.section][indexPath.row];
    MgSettingGroup *group = self.data[indexPath.section];
    MgSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    // 3、返回cell
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MgSettingGroup *group = self.data[indexPath.section];
    MgSettingItem *item = group.items[indexPath.row];
    UIViewController *vc = [[item.destVcClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MgSettingGroup *group = self.data[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    MgSettingGroup *group = self.data[section];
    return group.footer;
}
@end


