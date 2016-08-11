//
//  ViewController.m
//  WordsOfPieDemo
//
//  Created by 刘卫林 on 16/5/25.
//  Copyright © 2016年 lwl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@interface XMCircleTypeView : UIView

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDictionary *textAttributes;
@property (nonatomic) NSTextAlignment textAlignment;

@property (nonatomic) float radius;
@property (nonatomic) float baseAngle;
@property (nonatomic) float characterSpacing;
@property (nonatomic, strong) NSArray *LuckyTitelArray;

@end
