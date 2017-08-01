//
//  CollectionViewCell.m
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/6.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.backgroundColor = [UIColor lightGrayColor];
        self.titleLabel.layer.cornerRadius = 3;
        self.titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
@end
