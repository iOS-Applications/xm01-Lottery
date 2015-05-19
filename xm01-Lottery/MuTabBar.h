//
//  MuTabBar.h
//  xm01-Lottery
//
//  Created by GDUT on 15/4/22.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//
#import <UIKit/UIKit.h>

@class MuTabBar;
@protocol MuTabBarDelegate <NSObject>

@optional

- (void)tabBar:(MuTabBar *)tabBar didSelectButton:(int)btnTag;

@end
// 继承一个最纯洁的TabBar
@interface MuTabBar : UIView
@property (nonatomic, weak) id<MuTabBarDelegate> delegate;
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
