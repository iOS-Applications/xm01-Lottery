//
//  MgSettingCell.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MgSettingItem;
@interface MgSettingCell : UITableViewCell

// 提供一个item,给cell的控件设置数据
@property (nonatomic, strong) MgSettingItem *item;
// 提供一个方法创建tableVCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
