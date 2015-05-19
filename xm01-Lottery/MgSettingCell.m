 //
//  MgSettingCell.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingCell.h"
#import "MgSettingArrowItem.h"
#import "MgSettingSwitchItem.h"

@interface MgSettingCell()


@end

@implementation MgSettingCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    
//}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Sstting";
    MgSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MgSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (void)setItem:(MgSettingItem *)item
{
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的内容
    [self setupRightContent];
}

// 设置右边的内容
-(void)setupRightContent
{
    //
    if ([self.item isKindOfClass:[MgSettingArrowItem class]]) { // 箭头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    } else if ([self.item isKindOfClass:[MgSettingSwitchItem class]]) { // 开关
        self.accessoryView = [[UISwitch alloc] init];
    } else {
        self.accessoryView = nil;
    }
}

// 设置数据
-(void)setupData
{
    self.imageView.image = [UIImage imageNamed:_item.icon];
    self.textLabel.text = _item.title;
}

@end
