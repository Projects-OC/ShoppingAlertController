//
//  LCShoppingModel.h
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCShoppingTypesModel;
@class LCShoppingTypesInfoModel;

@interface LCShoppingModel : NSObject

@property (nonatomic,copy) NSString *id;

/** 图片 */
@property (nonatomic,copy) NSString *url;

/** 标题 */
@property (nonatomic,copy) NSString *title;

/** 商品编码 */
@property (nonatomic,copy) NSString *code;

/** 颜色 */
@property (nonatomic,copy) NSString *color;

/** 规格 */
@property (nonatomic,copy) NSString *size;

/** 库存 */
@property (nonatomic,copy) NSString *stock;

/** 数量 */
@property (nonatomic,copy) NSString *count;

/** 价格 */
@property (nonatomic,copy) NSString *money;

/** 是否选中 */
@property (nonatomic,assign) BOOL selected;

/** 是否可以点击 */
//@property (nonatomic,assign) BOOL enable;


/** 类型数组 */
@property (nonatomic,strong) NSMutableArray <LCShoppingTypesModel *>*typesModel;

@end


@interface LCShoppingTypesModel : NSObject

@property (nonatomic,copy) NSString *id;

/** section标题 */
@property (nonatomic,copy) NSString *title;

/** 详情标题 */
@property (nonatomic,strong) NSMutableArray <LCShoppingTypesInfoModel *>*typesInfoModel;

@end


@interface LCShoppingTypesInfoModel : NSObject

@property (nonatomic,copy) NSString *id;

/** section标题 */
@property (nonatomic,copy) NSString *title;

/** 是否选中 */
@property (nonatomic,assign) BOOL selected;

@end
