//
//  MgProductCell.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/20.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgProductCell.h"
#import "MgProduct.h"
@interface MgProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation MgProductCell
- (void)awakeFromNib
{
    // 生成圆角——用图层
    self.iconView.layer.cornerRadius = 8;
    // 把超出边界的要剪掉
    self.iconView.clipsToBounds = YES;
}

- (void)setProduct:(MgProduct *)product
{
    _product = product;
    
    self.iconView.image = [UIImage imageNamed:_product.icon];
//    self.iconView.image = [UIImage imageNamed:@"apper@2x.png"];
    self.titleLabel.text = _product.title;
//    NSLog(@"%@-----%@", _product.icon, _product.title);
}


@end
