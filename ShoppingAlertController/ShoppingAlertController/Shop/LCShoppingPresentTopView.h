//
//  LCShoppingPresentTopView.h
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCShoppingModel;

@interface LCShoppingPresentTopView : UIView

//Expression04
/** 图片 */
@property (nonatomic,strong) UIImageView *imgView;

/** 标题 */
@property (nonatomic,strong) UILabel *titleLb;

/** 副标题 */
@property (nonatomic,strong) UILabel *detailLb;

@property (nonatomic,strong) LCShoppingModel *model;

@end
