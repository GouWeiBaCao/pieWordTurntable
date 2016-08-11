//
//  ViewController.m
//  WordsOfPieDemo
//
//  Created by 刘卫林 on 16/5/25.
//  Copyright © 2016年 lwl. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "XMCircleTypeView.h"

@class LXMPieView;

@protocol LXMPieViewDelegate <NSObject>

- (void)lxmPieView:(LXMPieView *)pieView didSelectSectionAtIndex:(NSInteger)index;

@end


@interface LXMPieModel : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) float  value;
@property (nonatomic, copy) NSString *text;

- (instancetype)initWithColor:(UIColor *)color value:(CGFloat)value text:(NSString *)text;

@end



@interface LXMPieView : UIView
@property (nonatomic, strong) NSArray *LuckyTitelArray;

@property (nonatomic, weak) id<LXMPieViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame values:(NSArray<LXMPieModel *> *)valueArray titelsArr:(NSArray *)arr;

- (void)reloadData;

@end
