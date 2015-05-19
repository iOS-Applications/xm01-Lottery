//
//  MuTabBar.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/22.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//


#import "MuTabBar.h"
#import "MuTabBarButton.h"

//#define MuTabBarButtonCount 5

@interface MuTabBar ()
@property (nonatomic, weak) UIButton *selectedBtn;
@end

@implementation MuTabBar

- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName
{
    MuTabBarButton *button = [MuTabBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    [self addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];

    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    int count = self.subviews.count;
    for (int i=0; i< count; i++) {

        UIButton *button = self.subviews[i];
        
        button.tag = i;
        
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / count;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    
}


- (void)buttonClick:(UIButton *)btn
{
    //    NSLog(@"-----buttonClick:");
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButton:)]) {
        [self.delegate tabBar:self didSelectButton:btn.tag];
    }
    
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
//    self.selectedIndex = btn.tag;
}

@end
