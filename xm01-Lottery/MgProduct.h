//
//  MgProduct.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/20.
//  Copyright (c) 2015年 GDUT. All rights reserved.

/**
 "title": "网易电影票",
 "icon": "movie@2x.png",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "customUrl": "movieticket163"
 
 一个模型对应一个JSON对象, 把每一个JSON转成模型来用
 */
#import <UIKit/UIKit.h>

@interface MgProduct : UICollectionViewController

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *scheme; // 应用的协议头
@property (nonatomic, copy) NSString *url; // 下载应用的URL
@property (nonatomic, copy) NSString *identifier; // 应用的identifier
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
