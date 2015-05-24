//
//  MgHtmlViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgHtmlViewController.h"
#import "MgHtml.h"

@interface MgHtmlViewController () <UIWebViewDelegate>

@end

@implementation MgHtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    
    // 创建一个URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.html.html withExtension:nil];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 发送请求加载网页
    [webView loadRequest:request];

    // 设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 网页加载完毕的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 跳到ID对应的网页标签，OC中执行javaScript代码
    NSString *js = [NSString stringWithFormat:@"window.location.href='#%@';", self.html.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end
