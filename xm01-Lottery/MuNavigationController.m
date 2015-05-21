//
//  MuNavigationController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/22.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MuNavigationController.h"
//#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0


@implementation MuNavigationController
- (void)viewDidLoad
{
    [super viewDidLoad];

}


// 系统在第一次使用这个类时调用
+ (void)initialize
{
//    NSLog(@"initialize--------");
    // 3.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置导航栏图片
    NSString *bgName = nil;
    if (iOS7) { // 至少是iOS 7.0
        bgName = @"NavBar64";
//        navBar.tintColor = [UIColor whiteColor];
    } else { // 非iOS7
        bgName = @"NavBar";
    }
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    
    // 设置标题颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // UITextAttributeTextColor iOS_7
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:attrs];
    
    
    // 3.设置ItemButton的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    
    navBar.tintColor = [UIColor whiteColor];
//    navBar.barTintColor = [UIColor greenColor];
}

// 重写这个方法，就能拦截所有的push操作
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    // 不写这个，点按钮没反应
    [super pushViewController:viewController animated:animated];
    
}
@end
