//
//  LWLLotteryView.h
//  WordsOfPieDemo
//
//  Created by 刘卫林 on 16/5/25.
//  Copyright © 2016年 lwl. All rights reserved.
//

#import <UIkit/UIkit.h>
#import "LXMPieView.h"

@interface LWLLotteryView : UIView

@property (nonatomic, strong) LXMPieView *pieView;
@property (nonatomic, strong) NSMutableArray *LuckyTitelArray;
@property (strong, nonatomic) UIButton *choujiangBtn;
@property (nonatomic,assign) int luckIndex;//中奖的位置坐标
@property (nonatomic, strong)UIAlertView * excitAlert;

@end
