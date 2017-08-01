//
//  NumberTableViewCell.m
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "NumberTableViewCell.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface NumberTableViewCell()
@property(nonatomic,strong)UIView *numView;
@property(nonatomic,strong)UIButton *addButton;
@property(nonatomic,strong)UIButton *deductButton;
/** 数字*/
@property (nonatomic,assign)NSInteger num;
@end
@implementation NumberTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        self.num = 1;
        [self allViews];
    }
    return self;
}
- (void)allViews{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
    self.titleLabel.text = @"数量";
    [self.contentView addSubview:self.titleLabel];
    
    self.numView = [[UIView alloc]initWithFrame:CGRectMake(kScreenW-100, 10, 100, 40)];
//    self.numView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.numView];
    
    self.deductButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deductButton.frame = CGRectMake(0, 0, 20, 20);
    self.deductButton.backgroundColor = [UIColor lightGrayColor];
    [self.deductButton addTarget:self action:@selector(deductButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.deductButton setTitle:@"-" forState:UIControlStateNormal];
    [self.numView addSubview:self.deductButton];
    
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 40, 20)];
    self.numLabel.backgroundColor = [UIColor lightGrayColor];
    self.numLabel.text = @"1";
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    [self.numView addSubview:self.numLabel];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.frame = CGRectMake(70, 0, 20, 20);
    self.addButton.backgroundColor = [UIColor lightGrayColor];
    [self.addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.addButton setTitle:@"+" forState:UIControlStateNormal];
    [self.numView addSubview:self.addButton];
    
}
- (void)deductButtonAction{
    if (self.num>0) {
        self.num--;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%zd",self.num];
    !self.priceNumBlock?:self.priceNumBlock(self.num);
}
- (void)addButtonAction{
    self.num++;
    self.numLabel.text = [NSString stringWithFormat:@"%zd",self.num];
    !self.priceNumBlock?:self.priceNumBlock(self.num);
}
@end
