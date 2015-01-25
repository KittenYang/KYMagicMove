//
//  FirstCollectionViewController.m
//  KYMagicMove
//
//  Created by Kitten Yang on 1/19/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "FirstCollectionViewController.h"
#import "CollectionViewCell.h"
#import "SecondViewController.h"
#import "MagicMoveTransition.h"


@interface FirstCollectionViewController ()<UINavigationControllerDelegate>

@end

@implementation FirstCollectionViewController

static NSString * const reuseIdentifier = @"CollectionCell";



-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.delegate = self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
   
    
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController *secondVC = segue.destinationViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{

    if ([toVC isKindOfClass:[SecondViewController class]]) {
        MagicMoveTransition *transition = [[MagicMoveTransition alloc]init];
        return transition;
    }else{
        return nil;
    }
}

#pragma mark <UICollectionViewDataSource>
//section的数目
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个section Item的数目
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

//创建cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}



@end
