//
//  LCShoppingToobar.m
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingToobar.h"

@implementation LCShoppingToobar

- (instancetype)initWithTrolley:(BOOL)trolley{
    self = [super init];
    if (self) {
        _isTrolley = trolley;
        NSMutableArray *titles = @[@"加入购物车",@"立即购买"].mutableCopy;
        NSMutableArray *colors = @[LCYellowColor,LCRedColor].mutableCopy;
        if (_isTrolley) {
            [titles insertObject:@"购物车" atIndex:0];
            [colors insertObject:[UIColor whiteColor] atIndex:0];
        }
        for (int i=0; i< (_isTrolley ? 3:2); i++) {
            UIButton *_btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_btn setTag: _isTrolley ? i : i+1];
            [_btn setTitle:titles[i] forState:UIControlStateNormal];
            [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_btn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
            [_btn setBackgroundColor:colors[i]];
            [self addSubview:_btn];
            [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                if (_isTrolley) {
                    CGFloat itemWidth = 50;
                    CGFloat itemWidthOther = ((LCScreenWidth-itemWidth)/2);
                    make.size.mas_equalTo(CGSizeMake(i == 0 ? itemWidth : itemWidthOther, 49));
                    make.left.mas_equalTo(i == 0 ? 0 : (i == 1 ? itemWidth : itemWidth + itemWidthOther));
                }else{
                    make.left.mas_equalTo(i*(LCScreenWidth/2));
                    make.size.mas_equalTo(CGSizeMake(LCScreenWidth/2, 49));
                }
            }];
        }
    }
    return self;
}


- (void)selectClick:(UIButton *)button{
    if (_tapBlock) {
        _tapBlock(button.tag);
    }
}

@end
