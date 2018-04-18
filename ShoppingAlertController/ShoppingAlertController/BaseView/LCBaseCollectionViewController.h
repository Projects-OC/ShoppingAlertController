//
//  LCCollectionViewController.h
//  LCTechnology
//
//  Created by wff on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCBaseCollectionViewController : LCBaseViewController

@property (nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic,weak) UICollectionViewFlowLayout *layout;

@end
