//
//  MgProduct.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/20.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgProduct.h"

@implementation MgProduct
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 模型的属性和字典里的一模一样，直接用KVC就行了
//        [self setValuesForKeysWithDictionary:dict];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.scheme = dict[@"customUrl"];
        self.url = dict[@"url"];
        self.identifier = dict[@"id"];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
