//
//  MagicMoveInverseTransition.m
//  KYMagicMove
//
//  Created by Kitten Yang on 1/19/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "MagicMoveInverseTransition.h"
#import "FirstCollectionViewController.h"
#import "SecondViewController.h"
#import "CollectionViewCell.h"
#import "UIView+MotionBlur.h"

@implementation MagicMoveInverseTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //获取动画前后两个VC 和 发生的容器containerView
    FirstCollectionViewController *toVC = (FirstCollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SecondViewController *fromVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //在前一个VC上创建一个截图
    UIView  *snapShotView = [fromVC.imageViewForSecond snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect:fromVC.imageViewForSecond.frame fromView:fromVC.imageViewForSecond.superview];
    fromVC.imageViewForSecond.hidden = YES;
    
    //初始化后一个VC的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    //获取toVC中图片的位置
    CollectionViewCell *cell = (CollectionViewCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.indexPath];
    cell.imageView.hidden = YES;
//    CGRect finalRect =  [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    
    
    //顺序很重要，
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    
    //发生动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromVC.view.alpha = 0.0f;
        snapShotView.frame = toVC.finalCellRect;
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        fromVC.imageViewForSecond.hidden = NO;
        cell.imageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];


}
@end
