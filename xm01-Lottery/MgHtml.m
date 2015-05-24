//
//  MgHtml.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgHtml.h"

@implementation MgHtml

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    
    return self;
}

+(instancetype)htmlWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
