//
//  MuTabBarController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/22.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MuTabBarController.h"
#import "MuTabBar.h"

//#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0

@interface MuTabBarController () <MuTabBarDelegate>

@end

@implementation MuTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self.tabBar removeFromSuperview];
    
    MuTabBar *myTabBar = [[MuTabBar alloc] init];
    myTabBar.delegate = self;
    myTabBar.frame = self.tabBar.bounds;
//    [myTabBar setBackgroundColor:[UIColor blueColor]];
    [self.tabBar addSubview:myTabBar];
    
//    [self.view addSubview:myTabBar];
    
    // 2.添加对应个数按钮
    for (int i=0; i< self.viewControllers.count; i++) {
        
        NSString *norName = [NSString stringWithFormat:@"TabBar%d", i+1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel", i+1];
        
        [myTabBar addTabButtonWithName:norName selName:selName];
    }
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


- (void)tabBar:(MuTabBar *)tabBar didSelectButton:(int)btnTag
{
//    NSLog(@"%d", btnTag);
    self.selectedIndex = btnTag;
}
@end
