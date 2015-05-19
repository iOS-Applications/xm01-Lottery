//
//  MuTitleButton.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/25.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MuTitleButton.h"
@interface MuTitleButton ()
@property (nonatomic, strong) UIFont *titleFont;
@end

@implementation MuTitleButton


- (instancetype)initWithCoder:(NSCoder *)coder
{
//    NSLog(@"initWithCoder-----");
    self = [super initWithCoder:coder];
    if (self) {
        
//        NSLog(@"self.titleLabel.font---%@", self.titleLabel.font);
        [self setup];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.titleFont = [UIFont systemFontOfSize:15];
    self.titleLabel.font = self.titleFont;
    
    self.imageView.contentMode = UIViewContentModeCenter;
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;

    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    CGFloat titleH = contentRect.size.height;

    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
//    NSLog(@"imageRectForContentRect-----");
    CGFloat imageW = 30;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
