//
//  MgHelpViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgHelpViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingGroup.h"
#import "MgHtmlViewController.h"
#import "MuNavigationController.h"
#import "MgHtml.h"

@interface MgHelpViewController ()
@property (nonatomic, strong) NSArray *htmls;
@end

@implementation MgHelpViewController
- (NSArray *)htmls
{
    if (_htmls == nil) {
        NSMutableArray *htmlArray = [[NSMutableArray alloc] init];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in dictArray) {
            MgHtml *html = [MgHtml htmlWithDict:dict];
            [htmlArray addObject:html];
        }
        _htmls = htmlArray;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *itemArray = [NSMutableArray array];
    for (MgHtml *html in self.htmls) {
        MgSettingItem *item = [MgSettingArrowItem itemWithTitle:html.title destVcClass:nil];
        [itemArray addObject:item] ;
    }
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = itemArray;
    
    [self.data addObject:group];
}

# pragma mark - 数据源方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建网页控制控制
    MgHtmlViewController *htmlVc = [[MgHtmlViewController alloc] init];
    htmlVc.html = self.htmls[indexPath.row];
    
    MuNavigationController *nav = [[MuNavigationController alloc] initWithRootViewController:htmlVc];
    // 以modal方式进入
    [self presentViewController:nav animated:YES completion:nil];
}
@end
