//
//  LCShoppingPresentCollectionViewCell.m
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingPresentCollectionViewCell.h"
#import "LCShoppingModel.h"
#import "UIBezierPath+LC.h"

@implementation LCShoppingPresentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        {//效率不高
            _selectBtn.layer.borderColor = LCYellowColor.CGColor;
            _selectBtn.layer.borderWidth = 1;
            _selectBtn.layer.masksToBounds = YES;
            _selectBtn.layer.cornerRadius = 10;
            _selectBtn.clipsToBounds = YES;
            _selectBtn.contentMode = UIViewContentModeScaleAspectFill;
        }
        _selectBtn.titleLabel.font = LCFont(13);
        [_selectBtn setTitle:@"1*200" forState:UIControlStateNormal];
        [_selectBtn setTitleColor:LCYellowColor forState:UIControlStateNormal];
        [_selectBtn setBackgroundColor:[UIColor whiteColor]];
        [_selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectBtn];
        [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }

    return self;
}

- (void)setInfoModel:(LCShoppingTypesInfoModel *)infoModel{
    _infoModel = infoModel;
    [_selectBtn setTitle:infoModel.title forState:UIControlStateNormal] ;
    if (infoModel.selected) {
        [_selectBtn setBackgroundColor:LCYellowColor];
        [_selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [_selectBtn setBackgroundColor:[UIColor whiteColor]];
        [_selectBtn setTitleColor:LCYellowColor forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
//    [UIBezierPath drawRoundCornersSize:CGSizeMake(5, 5)
//                     byRoundingCorners:UIRectCornerAllCorners
//                                byView:_selectBtn];
}

- (void)selectClick:(UIButton *)button{
    _infoModel.selected = !_infoModel.selected;
    if (_selectBtnBlock) {
        _selectBtnBlock(_infoModel);
    }
}

@end
