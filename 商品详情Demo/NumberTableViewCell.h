//
//  NumberTableViewCell.h
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PriceNumBlock)(NSInteger price);
@interface NumberTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *numLabel;
/** 回调 */
@property (nonatomic,copy) PriceNumBlock priceNumBlock;
@end
