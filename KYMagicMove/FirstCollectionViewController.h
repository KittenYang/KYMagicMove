//
//  FirstCollectionViewController.h
//  KYMagicMove
//
//  Created by Kitten Yang on 1/19/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionViewCell;
@interface FirstCollectionViewController : UICollectionViewController

@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,assign)CGRect finalCellRect;

@end
