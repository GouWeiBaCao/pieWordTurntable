//
//  LWLLotteryView.m
//  WordsOfPieDemo
//
//  Created by 刘卫林 on 16/5/25.
//  Copyright © 2016年 lwl. All rights reserved.
//
//屏幕宽度
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE ([ UIScreen mainScreen ].bounds.size.width/320)
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define kColorLuckyBackGround RGBA(109,177,246,1)
#define kColorTaskGray RGBA(200, 200, 200, 1.0)
#define kColorDefaultBlack RGBA(20,22,28,1)
#define kColorLuckyBackGround RGBA(109,177,246,1)
#define kColorLuckyYellow RGBA(253,195,0,1)
#define kColorLuckyOrange RGBA(240,126,1,1)
#define kColorLuckyblue RGBA(21,129,237,1)
#define kColorLuckyblueAlp RGBA(21,129,237,0.3)
#define kColorDefaultBlue RGBA(22, 130, 239,1)  //默认蓝色（button选中时的颜色）




#import "LWLLotteryView.h"

@interface LWLLotteryView ()<LXMPieViewDelegate,UIAlertViewDelegate>

@end

@implementation LWLLotteryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREENW,SCREENH);
        self.backgroundColor = kColorLuckyBackGround;
        
    _LuckyTitelArray = [[NSMutableArray alloc]init];
    _LuckyTitelArray =@[@"400银豆", @"1000银豆", @"100银豆",@"600银豆", @"1银豆", @"2000银豆", @"200银豆",@"800银豆", @"1银豆",@"400银豆",];
        
        [self  creatGetLuckUI];
        
    }
    return self;
}

-(void)creatGetLuckUI{
    
    NSMutableArray *modelArray = [NSMutableArray array];
    NSArray *valueArray = @[@(10),@(10),@(10), @(10), @(10), @(10),@(10), @(10),@(10), @(10)];
  
    NSArray *colorArray = @[kColorLuckyYellow,
                            kColorLuckyOrange,
                            kColorLuckyblue,
                            kColorLuckyYellow,
                            kColorLuckyOrange,
                            kColorLuckyYellow,
                            kColorLuckyOrange,
                            kColorLuckyblue,
                            kColorLuckyYellow,
                            kColorLuckyOrange,];
    
    for (int i = 0 ; i <valueArray.count ; i++) {
        LXMPieModel *model = [[LXMPieModel alloc] initWithColor:colorArray[i] value:[valueArray[i] floatValue] text:nil];
        [modelArray addObject:model];
    }
    
    LXMPieView *pieView = [[LXMPieView alloc] initWithFrame:CGRectMake(30*SCREEN_SCALE, 90*SCREEN_SCALE, SCREENW-2*30*SCREEN_SCALE, SCREENW-2*30*SCREEN_SCALE) values:modelArray titelsArr:[_LuckyTitelArray copy]];
    pieView.delegate = self;
    [self addSubview:pieView];
    self.pieView = pieView;
 
    //开始抽奖按钮
    _choujiangBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENW/3-10,_pieView.maxY+50*SCREEN_SCALE,SCREENW/3+20,30*SCREEN_SCALE )];
    [_choujiangBtn setTitle:@"抽奖需20银豆" forState:UIControlStateNormal];
    [_choujiangBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_choujiangBtn setBackgroundColor:kColorDefaultBlue];
    _choujiangBtn.layer.borderColor = [kColorDefaultBlue CGColor];
    _choujiangBtn.layer.borderWidth = 1.0f;
    _choujiangBtn.layer.cornerRadius = 5.0f;
    _choujiangBtn.layer.masksToBounds = YES;
    [self addSubview:_choujiangBtn];
}

#pragma mark - LXMPieViewDelegate

- (void)lxmPieView:(LXMPieView *)pieView didSelectSectionAtIndex:(NSInteger)index {
    NSLog(@"didSelectSectionAtIndex : %@", @(index));
}




#pragma mark ==================---------点击抽奖=========
- (void)btnClick
{
    [self animationStart];
}
-(void)animationStart{
    //  NSInteger angle;
    [_choujiangBtn setTitle:@"抽奖中..." forState:UIControlStateNormal];

    NSInteger randomNum = arc4random()%2;
    if (randomNum == 0) {
        randomNum = 1;
    }
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //rotationAnimation.toValue = [NSNumber numberWithFloat:(_luckIndex*36-18)*M_PI/180+2*M_PI];
    NSLog(@"_luckIndex=======----==%d",_luckIndex);
    rotationAnimation.toValue = [NSNumber numberWithFloat:2*M_PI-(_luckIndex*36+18)*M_PI/180+2*M_PI];
    int angle =18;
    NSLog(@"rotationAnimation.toValue======%d",angle);
    rotationAnimation.duration = randomNum;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.pieView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


//动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [UIView animateWithDuration:0.0
                     animations:^{
                         [self showAlertView];
                     }
                     completion:^(BOOL finished) {
                         //[self hideLuckResultView];
                         
                         _choujiangBtn.frame =CGRectMake(SCREENW/3-10,_pieView.maxY+50*SCREEN_SCALE,SCREENW/3+20,30*SCREEN_SCALE );
                         [_choujiangBtn setTitle:@"抽奖需20银豆" forState:UIControlStateNormal];
                         _choujiangBtn.enabled = YES;
                     }];
    
}

-(void)showAlertView{
    _excitAlert = [[UIAlertView alloc] initWithTitle:@"恭喜你获得xx大奖"
                                             message:nil
                                            delegate:nil
                                   cancelButtonTitle:@"确定"
                                   otherButtonTitles:@"取消",nil];
    _excitAlert.delegate = self;
    [_excitAlert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        [_excitAlert removeFromSuperview];
    }
}


@end
