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
#import "MgSettingLabelItem.h"

// 获得RGB颜色
#define MgColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface MgSettingCell()
// 箭头
@property (nonatomic, strong) UIImageView *arrowView;
// 开关
@property (nonatomic, strong) UISwitch *switchView;
// 标签
@property (nonatomic, strong) UILabel *labelView;
// 分割线
@property (nonatomic, weak) UIView *divider;
@end

@implementation MgSettingCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    
//}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 1.初始化背景
        [self setupBg];
        
        // 2.初始化子控件
        [self setupSubviews];
        
        // 3.初始化分割线
        if (!iOS7) {
            [self setupDivider];
        }
    }
    return self;
}

// 初始化子控件
- (void)setupSubviews
{
    // 把Cell子控件的颜色清除掉
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

// 初始化背景
- (void)setupBg
{
    // 默认时背景
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    // 设置选中时的背景
    UIView *selectBg = [[UIView alloc] init];
    // 颜色在pch里面设置一个宏，到处用得上
    selectBg.backgroundColor = MgColor(237, 233, 218);
    self.selectedBackgroundView = selectBg;
}

// 拦截frame的设置
- (void)setFrame:(CGRect)frame
{
    if (!iOS7) {
        CGFloat padding = 10;
        frame.size.width += padding * 2;
        frame.origin.x = -padding;
    }
    [super setFrame:frame]; // 只写这句,相当于没写
}

// 3.初始化分割线
- (void)setupDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    
    self.divider = divider;
}

// 设置分割线的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (iOS7) return;
    // 设置分割线的frame
    CGFloat dividerX = 1;
    CGFloat dividerH = 1;
    CGFloat dividerY = self.contentView.frame.size.width - dividerH;
//    CGFloat dividerW = self.contentView.frame.size.width;
    CGFloat dividerW = [UIScreen mainScreen].bounds.size.width;

    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 30);
        _labelView.backgroundColor = [UIColor grayColor];
    }
    return _labelView;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}
                      
-(UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

- (void)switchStateChange
{
//    NSLog(@"%@----%d",self.item.title, self.switchView.isOn);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Setting";
    MgSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
//        cell = [[MgSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell = [[MgSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
    if ([self.item isKindOfClass:[MgSettingArrowItem class]]) { // 箭头
//        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[MgSettingSwitchItem class]]) { // 开关
//        self.accessoryView = [[UISwitch alloc] init];
        self.accessoryView = self.switchView;
        // 设置点击cell没有颜色反应
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 拿到开关设置开关的内容
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchView.on = [defaults boolForKey:self.item.title];
        
    }else if ([self.item isKindOfClass:[MgSettingLabelItem class]]) { // 标签
        self.accessoryView = self.labelView;
    } else {
        self.accessoryView = nil;
    }
}

// 设置数据
-(void)setupData
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subtitle;
}

@end
