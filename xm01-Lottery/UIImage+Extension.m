//
//  UIImage+Extension.m
//  xm01-Lottery
//
//  Created by GDUT on 15/4/26.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)resizableImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageW, imageH, imageW, imageH)];

}
@end
