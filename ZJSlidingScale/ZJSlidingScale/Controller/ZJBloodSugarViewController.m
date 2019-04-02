//
//  ZJBloodSugarViewController.m
//  ZJSlidingScale
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJBloodSugarViewController.h"

#import "ZJBloodSugarConfig.h"

@interface ZJBloodSugarViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bgValueLabel;
@property (strong, nonatomic) IBOutlet ZJBloodSugarConfig *rulerController;
@property (weak, nonatomic) IBOutlet UICollectionView *rulerCollectionView;
@property (weak, nonatomic) IBOutlet UIView *rulerBackView;
@property (weak, nonatomic) IBOutlet UILabel *normalValueLabel;
@end

@implementation ZJBloodSugarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self makeUI];
    
    
}

- (void)makeUI {
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50+SafeAreaTopHeight, SCREEN_WIDTH, 30)];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.text = @"滑动录入";
    self.rulerCollectionView.delegate = self.rulerController;
    self.rulerCollectionView.dataSource = self.rulerController;
    self.normalValueLabel.text = [NSString stringWithFormat:@"正常参考范围: 3.0~10.0"];
    
    __weak typeof(self) weakSelf = self;
    self.rulerController.block = ^(id obj){
        NSLog(@"%@",((NSString *)obj));
        weakSelf.bgValueLabel.text = @"2";
//        NSNumber* timePointLelveID = [NSNumber numberWithInteger:weakSelf.currentTimePointLevelModel.levelID];
//        NSString* colorString = [BGModel currentBGLevelModel:[obj floatValue] timePointID:timePointLelveID].bgColorString;
        //        NSLog(@"colorString=========:::%@", colorString);
//        weakSelf.bgValueLabel.textColor = [UIColor colorWithHexString:colorString];
    };
    
}

- (void)bloodSugarUI {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
