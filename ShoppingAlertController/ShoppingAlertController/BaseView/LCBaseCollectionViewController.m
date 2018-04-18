//
//  LCCollectionViewController.m
//  LCTechnology
//
//  Created by wff on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseCollectionViewController.h"

@interface LCBaseCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation LCBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.headerReferenceSize = CGSizeZero;
        layout.itemSize = CGSizeZero;
        layout.sectionInset = UIEdgeInsetsZero;
        [layout setMinimumInteritemSpacing:0.0f];
        [layout setMinimumLineSpacing:0.0f];
        _layout = layout;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.showsVerticalScrollIndicator = NO;
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[UICollectionViewCell className] forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

@end
