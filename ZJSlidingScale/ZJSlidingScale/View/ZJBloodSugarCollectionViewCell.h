//
//  ZJBloodSugarCollectionViewCell.h
//  ZJSlidingScale
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJBloodSugarCollectionViewCell : UICollectionViewCell
{
    UIColor *_color;
    CGFloat _num;
}
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

@property (nonatomic) NSInteger row;

@end

NS_ASSUME_NONNULL_END
