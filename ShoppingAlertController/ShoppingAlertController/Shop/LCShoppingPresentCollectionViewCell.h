//
//  LCShoppingPresentCollectionViewCell.h
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCShoppingTypesInfoModel;

@interface LCShoppingPresentCollectionViewCell : UICollectionViewCell

/** 选择框 */
@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,weak) LCShoppingTypesInfoModel *infoModel;

@property (nonatomic,copy) void (^selectBtnBlock)(LCShoppingTypesInfoModel *infoModel);

@end
