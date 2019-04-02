//
//  ZJBloodSugarCollectionViewCell.m
//  ZJSlidingScale
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJBloodSugarCollectionViewCell.h"

@implementation ZJBloodSugarCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _color = [UIColor colorWithHexString:@"8f9da6"];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _color = [UIColor colorWithHexString:@"8f9da6"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.row > 0) {
        self.middleLabel.text = [NSString stringWithFormat:@"%.1f", (self.row + 1) * 1.0 + 0.5];;
        self.maxLabel.text = [NSString stringWithFormat:@"%.1f", (self.row + 1) * 1.0 + 1];
        self.minLabel.text = @"";
    }else{
        
        self.minLabel.text = @"1.0";
        self.middleLabel.text = @"1.5";
        self.maxLabel.text = @"2.0";
    }
}


- (void)drawRect:(CGRect)rect {
    CGFloat lineWidth = 2;
    UIColor *color = _color;
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = lineWidth;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    // 假设最大值20mmol/L 但是实际UI上取中间值所以要大点，但是一下子加载太多会很卡
    for (int i = 0; i <= 10; i++) {
        
        CGFloat lineHeight = 20;
        if (i % 5 == 0 && i % 10 != 0) {
            lineHeight = 25;
        }else if (i % 10 == 0){
            lineHeight = 30;
        }
        
        [aPath moveToPoint:CGPointMake(i * 10, 0)];
        
        [aPath addLineToPoint:CGPointMake(i * 10, lineHeight)];
        
        [aPath stroke];
        
    }
}

@end
