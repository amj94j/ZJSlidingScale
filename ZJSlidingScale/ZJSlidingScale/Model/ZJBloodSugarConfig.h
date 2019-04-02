//
//  ZJBloodSugarConfig.h
//  ZJSlidingScale
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBloodSugarViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^BGRulerControllerBlock) (id obj);

@interface ZJBloodSugarConfig : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) BGRulerControllerBlock block;

@end

NS_ASSUME_NONNULL_END
