//
//  LCShoppingPresentViewController.m
//  LCTechnology
//
//  Created by Mac on 2018/3/22.
//  Copyright © 2018年 MF. All rights reserved.
//

#import "LCShoppingPresentViewController.h"
#import "LCShoppingPresentCollectionViewCell.h"
#import "LCShoppingPresentHeaderView.h"
#import "LCShoppingPresentFooterView.h"
#import "LCShoppingPresentTopView.h"
#import "LCShoppingToobar.h"
#import "LCShoppingModel.h"
#import "NSString+LC.h"

#define presentHeight LCScreenHeight/2 + 100
#define collectionViewItemHeight 40

@interface LCShoppingPresentViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) LCShoppingPresentTopView *topView;

@property (nonatomic,strong) LCShoppingToobar *toobar;

@property (nonatomic,strong) LCShoppingModel *model;

@end

@implementation LCShoppingPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutView];
    [self updatePreferredContentSizeWithTraitCollection:self.traitCollection];
}

- (void)layoutView{
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(LCScreenWidth,100));
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 0, 50, 0));
    }];
    
    [self.view addSubview:self.toobar];
    [self.toobar layoutIfNeeded];
    [self.toobar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(49);
    }];
}

- (LCShoppingModel *)model{
    if (!_model) {
        _model = [[LCShoppingModel alloc] init];
        _model.title = @"桌椅凳子茶几";
        _model.code = @"商品编码：0923u4o02u384";
        _model.count = @"103";
        _model.url = @"Expression04";

        LCShoppingTypesModel *typeColors = [[LCShoppingTypesModel alloc] init];
        typeColors.title = @"颜色";
        LCShoppingTypesInfoModel *infoModel1 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel1.title = @"红色";
        LCShoppingTypesInfoModel *infoModel2 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel2.title = @"绿色";
        LCShoppingTypesInfoModel *infoModel3 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel3.title = @"白色黑色绿色浅色";
        typeColors.typesInfoModel = @[infoModel1,infoModel2,infoModel3].mutableCopy;

        LCShoppingTypesModel *typeSizes = [[LCShoppingTypesModel alloc] init];
        typeSizes.title = @"123";
        LCShoppingTypesInfoModel *infoModel4 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel4.title = @"144";
        LCShoppingTypesInfoModel *infoModel5 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel5.title = @"155";
        LCShoppingTypesInfoModel *infoModel6 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel6.title = @"166";
        LCShoppingTypesInfoModel *infoModel65 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel65.title = @"177";
        LCShoppingTypesInfoModel *infoModel665 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel665.title = @"188";
        typeSizes.typesInfoModel = @[infoModel4,infoModel5,infoModel6,infoModel65,infoModel665].mutableCopy;

        LCShoppingTypesModel *types = [[LCShoppingTypesModel alloc] init];
        types.title = @"类型";
        LCShoppingTypesInfoModel *infoModel7 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel7.title = @"桌子";
        LCShoppingTypesInfoModel *infoModel8 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel8.title = @"椅子";
        LCShoppingTypesInfoModel *infoModel9 = [[LCShoppingTypesInfoModel alloc] init];
        infoModel9.title = @"凳子";
        types.typesInfoModel = @[infoModel7,infoModel8,infoModel9].mutableCopy;

        _model.typesModel = @[typeColors,typeSizes,types].mutableCopy;
    }
    return _model;
}

- (LCShoppingPresentTopView *)topView{
    if (!_topView) {
        _topView = [[LCShoppingPresentTopView alloc] init];
        [self.view addSubview:_topView];
    }

    _topView.model = self.model;
    return _topView;
}

- (LCShoppingToobar *)toobar{
    if (!_toobar) {
        _toobar = [[LCShoppingToobar alloc] initWithTrolley:NO];
    }
    @weakify(self)
    _toobar.tapBlock = ^(LCToolBarType type) {
        [weak_self dismissViewControllerAnimated:YES completion:^{}];

    };
    return _toobar;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.headerReferenceSize = CGSizeMake(LCScreenWidth, 40);
//        layout.itemSize = CGSizeMake(LCPresentItemWidth, 50);
        [layout setMinimumInteritemSpacing:10];
        [layout setMinimumLineSpacing:5];
        [layout setSectionInset:UIEdgeInsetsMake(0, 10, 0, 10)];

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[LCShoppingPresentCollectionViewCell class]
           forCellWithReuseIdentifier:[LCShoppingPresentCollectionViewCell className]];
        [_collectionView registerClass:[LCShoppingPresentHeaderView class]
           forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                  withReuseIdentifier:[LCShoppingPresentHeaderView className]];
        [_collectionView registerClass:[LCShoppingPresentFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:[LCShoppingPresentFooterView className]];
    }
    return _collectionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCShoppingPresentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[LCShoppingPresentCollectionViewCell className] forIndexPath:indexPath];
    LCShoppingTypesModel *typsModel = self.model.typesModel[indexPath.section];
    LCShoppingTypesInfoModel *infoModel = typsModel.typesInfoModel[indexPath.row];
    cell.infoModel = infoModel;
    cell.selectBtnBlock = ^(LCShoppingTypesInfoModel *infoModel) {
        [typsModel.typesInfoModel enumerateObjectsUsingBlock:^(LCShoppingTypesInfoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.title isEqualToString:infoModel.title]) {
                obj.selected = infoModel.selected;
            }else{
                obj.selected = NO;
            }
        }];
        self.model.typesModel[indexPath.section].typesInfoModel = typsModel.typesInfoModel;
        [collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
    };
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        LCShoppingTypesModel *typsModel = self.model.typesModel[indexPath.section];
        LCShoppingPresentHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                     withReuseIdentifier:[LCShoppingPresentHeaderView className] forIndexPath:indexPath];
        headerView.titleLb.text = typsModel.title;
        return  headerView;
    }else if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == self.model.typesModel.count -1) {
            LCShoppingPresentFooterView *footeView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                        withReuseIdentifier:[LCShoppingPresentFooterView className] forIndexPath:indexPath];
            footeView.count = self.model.count;
            return footeView;
        }
        return nil;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section {
    if (section == self.model.typesModel.count -1) {
        return CGSizeMake(self.view.width, 40);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCShoppingTypesModel *typesModel = self.model.typesModel[indexPath.section];
    LCShoppingTypesInfoModel *infoModel = typesModel.typesInfoModel[indexPath.row];
    CGFloat sizeWidth = [infoModel.title
                         widthWithFont:LCFont(13)
                         constrainedToSize:CGSizeMake(LCScreenWidth-40, collectionViewItemHeight)];
    return CGSizeMake(sizeWidth+30, collectionViewItemHeight);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.model.typesModel.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    LCShoppingTypesModel *typesModel = self.model.typesModel[section];
    return typesModel.typesInfoModel.count;
}


#pragma transitionDelegate
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
              withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [self updatePreferredContentSizeWithTraitCollection:newCollection];
}
- (void)updatePreferredContentSizeWithTraitCollection:(UITraitCollection *)traitCollection{
    self.preferredContentSize = CGSizeMake(self.view.width, presentHeight);
}


@end
