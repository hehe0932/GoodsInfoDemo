//
//  SizeTableViewCell.h
//  商品详情Demo
//
//  Created by chenlishuang on 17/7/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectItemBlock)(NSString *str);
@interface SizeTableViewCell : UITableViewCell
/** 尺码数组*/
@property (nonatomic,strong)NSArray *sizeArray;
/** 头标题*/
@property (nonatomic,strong)NSString *title;
/** 回调 */
@property (nonatomic,copy) SelectItemBlock selectItemBlock;
@end
