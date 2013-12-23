//
//  ListCollectionViewController.h
//  jd
//
//  Created by CR on 13-12-12.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong,nonatomic) NSMutableArray *photoImages;
@property (nonatomic, strong)NSString *recipeNameas;

@end
