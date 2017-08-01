//
//  ViewController.m
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "ViewController.h"
#import "SizeTableViewCell.h"
#import "ColorTableViewCell.h"
#import "NumberTableViewCell.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

static NSString *const sizeCellID = @"sizeCellID";
static NSString *const colorCellID = @"colorCellID";
static NSString *const numberCellID = @"numberCellID";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
/** 透明背景图*/
@property (nonatomic,strong)UIView *backgroundView;
@property (nonatomic,strong)UIView *detailView;
@property (nonatomic,strong)UIView *headerView;
@property (nonatomic,strong)UITableView *detailTableView;
/** 完成按钮*/
@property (nonatomic,strong)UIButton *doneButton;
/** 尺码数组*/
@property (nonatomic,strong)NSArray *sizeArray;
/** 尺码*/
@property (nonatomic,strong)NSString *sizeString;
/** 颜色数组*/
@property (nonatomic,strong)NSArray *colorArray;
/** 颜色*/
@property (nonatomic,strong)NSString *colorString;
/** 商品图*/
@property (nonatomic,strong)UIImageView *goodsImageView;
/** 价格*/
@property (nonatomic,strong)UILabel *priceLabel;
/** 详情*/
@property (nonatomic,strong)UILabel *descriptionLabel;
/** 返回按钮*/
@property (nonatomic,strong)UIButton *returnButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sizeString = self.sizeArray[0];
    self.colorString = self.colorArray[0];
    [self initView];
    [self registTableViewCell];
}
- (void)initView{
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.detailView];
    [self.detailView addSubview:self.headerView];
    [self.detailView addSubview:self.detailTableView];
    [self.detailView addSubview:self.doneButton];
    [self.headerView addSubview:self.goodsImageView];
    [self.headerView addSubview:self.priceLabel];
    [self.headerView addSubview:self.descriptionLabel];
    [self.headerView addSubview:self.returnButton];
}

- (void)registTableViewCell {
    [self.detailTableView registerClass:[SizeTableViewCell class] forCellReuseIdentifier:sizeCellID];
    [self.detailTableView registerClass:[ColorTableViewCell class] forCellReuseIdentifier:colorCellID];
    [self.detailTableView registerClass:[NumberTableViewCell class] forCellReuseIdentifier:numberCellID];
}
- (IBAction)buttonAction:(id)sender {
    
    [UIView animateWithDuration:.3 animations:^{
        self.backgroundView.alpha = 0.5;
        self.detailView.frame = CGRectMake(0, kScreenH*0.5, kScreenW, kScreenH*0.5);
    }];
    
}
- (void)doneAction{
    self.detailLabel.text = [NSString stringWithFormat:@"已选\"%@码\"\"%@色\"",self.sizeString,self.colorString];
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 0;
        self.detailView.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH*0.5);
    }];
    NSLog(@"完成");
}
- (void)returnAction{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 0;
        self.detailView.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH*0.5);
    }];
}
#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        SizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sizeCellID];
        if (!cell) {
            cell = [[SizeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sizeCellID];
        }
        cell.sizeArray = self.sizeArray;
        cell.title = @"尺码";
        cell.selectItemBlock = ^(NSString *str){
            self.sizeString = str;
            self.descriptionLabel.text = [NSString stringWithFormat:@"已选\"%@码\"\"%@色\"",self.sizeString,self.colorString];
//            [self.detailTableView reloadData];
        };
        return cell;
    }else if (indexPath.row == 1){
        ColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:colorCellID];
        if (!cell) {
            cell = [[ColorTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:colorCellID];
        }
        cell.title = @"颜色";
        cell.sizeArray = self.colorArray;
        cell.selectItemBlock = ^(NSString *str){
            self.colorString = str;
            self.descriptionLabel.text = [NSString stringWithFormat:@"已选\"%@码\"\"%@色\"",self.sizeString,self.colorString];
//            [self.detailTableView reloadData];
        };
        return cell;
    }else if (indexPath.row == 2){
        NumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:numberCellID];
        if (!cell) {
            cell = [[NumberTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:numberCellID];
        }
        cell.priceNumBlock = ^(NSInteger price){
            
            self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f",53.00*price];
            NSLog(@"%zd",53*price);
        };
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CGFloat cellHeight = (self.sizeArray.count/6+1)*40+20;
        return cellHeight;
    }else if (indexPath.row == 1){
        CGFloat cellHeight = (self.colorArray.count/6+1)*40+20;
        return cellHeight;
    }else{
        return 90;
        
    }
}

#pragma mark - 懒加载
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0;
        
    }
    return _backgroundView;
}
- (UIView *)detailView{
    if (!_detailView) {
        _detailView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenH, kScreenW, kScreenH*0.5)];
        _detailView.backgroundColor = [UIColor whiteColor];
    }
    return _detailView;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 90)];
    }
    return _headerView;
}
- (UIImageView *)goodsImageView{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 12, 70, 70)];
        _goodsImageView.image = [UIImage imageNamed:@"爽哥"];
    }
    return _goodsImageView;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.goodsImageView.frame)+10, 20, 100, 30)];
        _priceLabel.text = [NSString stringWithFormat:@"￥%@",@"53.00"];
        _priceLabel.textColor = [UIColor redColor];
    }
    return _priceLabel;
}
- (UILabel *)descriptionLabel{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.goodsImageView.frame)+10,CGRectGetMaxY(self.priceLabel.frame), 200, 30)];
        _descriptionLabel.text = [NSString stringWithFormat:@"已选\"%@码\"\"%@色\"",self.sizeString,self.colorString];
    }
    return _descriptionLabel;
}
- (UITableView *)detailTableView{
    if (!_detailTableView) {
        _detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 90, kScreenW, kScreenH*0.5-90-44)];
        _detailTableView.delegate = self;
        _detailTableView.dataSource = self;
    }
    return _detailTableView;
}
- (UIButton *)returnButton{
    if (!_returnButton) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _returnButton.frame = CGRectMake(kScreenW-30, 5, 22, 22);
        [_returnButton setTitle:@"X" forState:UIControlStateNormal];
        [_returnButton setBackgroundColor:[UIColor yellowColor]];
        [_returnButton addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}
- (UIButton *)doneButton{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.frame = CGRectMake(0, CGRectGetMaxY(self.detailTableView.frame), kScreenW, 44);
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        [_doneButton setBackgroundColor:[UIColor redColor]];
    }
    return _doneButton;
}
- (NSArray *)sizeArray{
    if (!_sizeArray) {
        _sizeArray = @[@"S",@"M",@"L",@"XL",@"XXL",@"XXXl",@"XXXXL",@"5XL",@"6Xl"];
    }
    return _sizeArray;
}
- (NSArray *)colorArray{
    if (!_colorArray) {
        _colorArray = @[@"赤",@"橙",@"黄",@"绿"];
    }
    return _colorArray;
}
@end
