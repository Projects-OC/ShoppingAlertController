//
//  LCBaseViewController.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBaseViewController : UIViewController

@property(nonatomic,assign)NSInteger page;

/**
 导航是否透明
 */
- (void)setNavigationBarAlpha:(BOOL)alpha;

@end
