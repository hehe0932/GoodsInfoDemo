//
//  SizeTableViewCell.m
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "SizeTableViewCell.h"
#import "CollectionViewCell.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface SizeTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/** 标题*/
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)UICollectionView *collectionView;

@end
@implementation SizeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        [self allViews];
    }
    return self;
}
- (void)allViews{
    
    
}
- (void)setSizeArray:(NSArray *)sizeArray{
    self.dataArray = sizeArray;
    CGFloat viewHeight = (sizeArray.count/6+1)*40+10;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

    layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    layout.headerReferenceSize = CGSizeMake(100, 30);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, viewHeight) collectionViewLayout:layout];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"item_id"];
    [self.contentView addSubview:self.collectionView];
    
}
#pragma mark------UICollectionViewDataSource
//每个分区item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%@",self.dataArray);
    return self.dataArray.count;
}

//每个item的显示内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //去重用池查找创建cell
    CollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"item_id" forIndexPath:indexPath];
    item.layer.cornerRadius = 3;
    item.titleLabel.text = self.dataArray[indexPath.item];
    return item;
}


//设置分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


#pragma mark ---------UICollectionViewDelegate
//已经选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.titleLabel.textColor = [UIColor whiteColor];
    !self.selectItemBlock?:self.selectItemBlock(cell.titleLabel.text);
    NSLog(@"已选中Item%zd",indexPath.item);
}
//未选中
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.textColor = [UIColor grayColor];
    cell.backgroundColor = [UIColor lightGrayColor];

}
//创建头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader" forIndexPath:indexPath];
    //    headView.backgroundColor = [UIColor redColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 50, 35)];
    titleLabel.text = self.title;
    [headView addSubview:titleLabel];
    return headView;
}
#pragma mark------ UICollectionViewFlowLayout
//设置item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(55 , 20);
}

@end
