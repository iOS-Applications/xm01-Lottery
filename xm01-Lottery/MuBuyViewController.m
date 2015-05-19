//
//  MuBuyViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/26.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MuBuyViewController.h"

@interface MuBuyViewController ()

- (IBAction)titleClick:(UIButton *)sender;

@end
@implementation MuBuyViewController


- (IBAction)titleClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.05 animations:^{
//        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform rotation = sender.imageView.transform;
        sender.imageView.transform = CGAffineTransformRotate(rotation, M_PI);
    }];

    // 添加一个UIView
    UIView *tempView = [[UIView alloc] init];
    tempView.frame = CGRectMake(10, 70, 100, 100);
    tempView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:tempView];
}
@end
