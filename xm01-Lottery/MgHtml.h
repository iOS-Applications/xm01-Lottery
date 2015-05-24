//
//  MgHtml.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MgHtml : NSObject
// 网页的标题
@property (nonatomic, copy) NSString *title;
// 网页的文件名
@property (nonatomic, copy) NSString *html;
// ID号
@property (nonatomic, copy) NSString *ID;

+ (instancetype)htmlWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
