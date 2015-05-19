 //
//  MgSettingCell.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingCell.h"
#import "MgSettingItem.h"

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
    self.imageView.image = [UIImage imageNamed:_item.icon];
    self.textLabel.text = _item.title;
}

@end
