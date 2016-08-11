//
//  ViewController.m
//  WordsOfPieDemo
//  Created by 刘卫林 on 16/5/25.
//  Copyright © 2016年 lwl. All rights reserved.

#import "ViewController.h"
#import "LXMPieView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LWLLotteryView *lotterView = [[LWLLotteryView alloc] init];
    [self.view addSubview:lotterView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
