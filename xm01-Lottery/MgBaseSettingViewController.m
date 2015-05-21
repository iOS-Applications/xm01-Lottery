//
//  MgBaseSettingViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgBaseSettingViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingSwitchItem.h"
#import "MgSettingGroup.h"
#import "MgSettingCell.h"
#import "MBProgressHUD+MJ.h"

@implementation MgBaseSettingViewController

// 懒加载
- (NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
        
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
    MgSettingGroup *group = self.data[indexPath.section];
    MgSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    // 3、返回cell
    return cell;
}
// 点击cell要做的事
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取消选中行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.模型数据
    MgSettingGroup *group = self.data[indexPath.section];
    MgSettingItem *item = group.items[indexPath.row];
    
    
    if (item.option) { // block有值(点击这个cell有特定的操作要执行)
        // 使用语所有类型的Item，好!
        item.option();
    }else if ([item isKindOfClass:[MgSettingArrowItem class]]) { // 箭头
        MgSettingArrowItem *arrowItem = (MgSettingArrowItem *)item;
        // 如果没有需要跳转的控制器
        if (arrowItem.destVcClass == nil) return;
        UIViewController *vc = [[arrowItem.destVcClass alloc] init];
        vc.title = arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
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

