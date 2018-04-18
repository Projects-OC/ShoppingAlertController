//
//  LCShoppingToobar.h
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCShoppingToobar : UIView

- (instancetype)initWithTrolley:(BOOL)trolley;

/**
 是否看到购物车
 */
@property (nonatomic,assign) BOOL isTrolley;

@property (nonatomic,copy) void (^ tapBlock)(LCToolBarType type);

@end
