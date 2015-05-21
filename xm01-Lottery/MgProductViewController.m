//
//  MgProductViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/20.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#define MgProductCellID @"product"
#import "MgProductViewController.h"
#import "MgProduct.h"
#import "MgProductCell.h"

@interface MgProductViewController ()
@property (nonatomic, strong) NSArray *products;
@end

@implementation MgProductViewController

// products数组懒加载
- (NSArray *)products
{
    if (_products == nil) {
        
        NSMutableArray *productArray = [NSMutableArray array];
        // JSON文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"product_2.json" ofType:nil];
        // 加载JSON文件，把它转换成二进制的
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 将JSON数据转成NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 将字典转成模型
        for (NSDictionary *dict in dictArray) {
            MgProduct *product = [MgProduct productWithDict:dict];
            [productArray addObject:product];
        }
        _products = productArray;
    }
    
    return _products;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1、注册cell(告诉collectionView将来创建怎样的cell)
    // 通过xib创建cell,这里的代码就不能这么写
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MgProductCellID];
    
    UINib *nib = [UINib nibWithNibName:@"MgProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:MgProductCellID];
    
    // 2、设置collectionView的背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (instancetype)init
{
    // 1、流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2、每一个cell的尺寸
    layout.itemSize = CGSizeMake(80, 80);
    // 3、设置水平间距
    layout.minimumInteritemSpacing = 0;
    // 3、设置垂直间距
    layout.minimumLineSpacing = 10;
    
    // 4、设置cellZ的四面八方间距=顶部、左、下、右
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}

#pragma mark - 数据源方法
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // 有多少个产品，取决于产品数组的长度
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1、获得cell
    MgProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MgProductCellID forIndexPath:indexPath];

    MgProduct *product = self.products[indexPath.item];
    // 2、传递数据模型
    cell.product = product;
    
    return cell;
}

#pragma mark - 代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MgProduct *product = self.products[indexPath.item];
//    NSLog(@"------%@", product.title);
}
@end
