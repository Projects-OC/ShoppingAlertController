//
//  LCShoppingCountChangeView.h
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCShoppingCountChangeView : UIView

@property (nonatomic,strong) UITextField *numTextField;

@property (nonatomic,copy) void (^shopingCountBlock)(NSInteger);

@end
