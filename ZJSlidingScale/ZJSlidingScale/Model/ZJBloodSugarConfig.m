//
//  ZJBloodSugarConfig.m
//  ZJSlidingScale
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJBloodSugarConfig.h"
#import "ZJBloodSugarCollectionViewCell.h"

@implementation ZJBloodSugarConfig

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 33;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZJBloodSugarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.row = indexPath.item;
    //    cell.layer.borderColor = [UIColor purpleColor].CGColor;
    //    cell.layer.borderWidth = 1.0f;
//    [cell setNeedsLayout];//这句话没事加上去看看效果
    return cell;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, collectionView.width    / 2.0, 0, collectionView.width / 2.0);
}

#pragma mark -
#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    //    NSInteger shiwei = (x - 20) / 10;
    //    NSInteger gewei = 10 - shiwei;
    
    NSLog(@"%f",x/* - (shiwei * 10 + gewei)*/);
    /*
     int shiwei = (x - 20) / 10
     int gewei = 10 - shiwei
     
     20    57 - 37   57 -ab = 57 - (((57 - 20) / 10) * 10 + )
     21    67 - 46
     22    77 - 55
     23    87 - 64
     */
    
    [self resetDetViewByScrollView:scrollView];
}

//减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //    首先拿到标尺的中心位置X
    CGFloat pointX = scrollView.width / 2.0;
    //    拿到内容的偏移量X
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //    偏移量 + 标尺的位置，就是scrollView便宜的中心位置
    CGFloat svCenterX = pointX + offsetX;
    CGFloat distance = [UIScreen mainScreen].bounds.size.width > 333 ? 0.5 : -0.5;
    NSInteger x = svCenterX / 10;//取整  向前还是向后取整
    scrollView.contentOffset = CGPointMake(x * 10 - (NSInteger)(pointX / 10) * 10 + distance, 0);
    
    [self resetDetViewByScrollView:scrollView];
    
}

//松开的时候，没有减速效果时候使用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        //    首先拿到标尺的中心位置X
        CGFloat pointX = scrollView.width / 2.0;
        //    拿到内容的偏移量X
        CGFloat offsetX = scrollView.contentOffset.x;
        
        //    偏移量 + 标尺的位置，就是scrollView便宜的中心位置
        CGFloat svCenterX = pointX + offsetX;
        CGFloat distance = [UIScreen mainScreen].bounds.size.width > 333 ? 0.5 : -0.5;
        NSInteger x = svCenterX / 10;//取整  向前还是向后取整
        scrollView.contentOffset = CGPointMake(x * 10 - (NSInteger)(pointX / 10) * 10 + distance, 0);
        
        [self resetDetViewByScrollView:scrollView];
        
    }
    
}

- (void)resetDetViewByScrollView:(UIScrollView *)scrollView {
    
    BGRulerControllerBlock block = self.block;
    if (block) {
        block([NSString stringWithFormat:@"%.1f", ABS(scrollView.contentOffset.x / 100.0 + 1)]);
    }
    
}

@end
