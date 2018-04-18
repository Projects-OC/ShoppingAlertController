//
//  LCShopingCountChangeView.m
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingCountChangeView.h"

@interface LCShoppingCountChangeView ()<UITextFieldDelegate>

@end

@implementation LCShoppingCountChangeView

- (instancetype)init{
    self = [super init];
    if (self) {
        
        //数字
        _numTextField = [[UITextField alloc] init];
        _numTextField.textColor = LCBlackColor;
        _numTextField.text = @"10";
        _numTextField.font = LCFont(13);
        _numTextField.delegate = self;
        _numTextField.textAlignment = NSTextAlignmentCenter;
        _numTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:_numTextField];
        [_numTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        //增加
        UIButton *_addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setImage:[UIImage imageNamed:@"shoppingcart_btn_increase"] forState:UIControlStateNormal];
        [_addBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        [self addSubview:_addBtn];
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.left.equalTo(_numTextField.mas_right);
        }];
        @weakify(self)
        [_addBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            NSInteger count = _numTextField.text.integerValue;
            count += 1;
            _numTextField.text = [NSString stringWithFormat:@"%ld",count];
            if (weak_self.shopingCountBlock) {
                weak_self.shopingCountBlock(count);
            }
        }];
        
        //减少
        UIButton *_subtractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subtractBtn setImage:[UIImage imageNamed:@"shoppingcart_btn_decrease"] forState:UIControlStateNormal];
        [_subtractBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        [self addSubview:_subtractBtn];
        [_subtractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.right.equalTo(_numTextField.mas_left);
        }];
        [_subtractBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            NSInteger count = _numTextField.text.integerValue;
            if (_numTextField.text.integerValue > 1) {
                count -= 1;
                _numTextField.text = [NSString stringWithFormat:@"%ld",count];
            }
            if (weak_self.shopingCountBlock) {
                weak_self.shopingCountBlock(count);
            }
        }];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
