//
//  ViewController.m
//  BabyUrineDetector
//
//  Created by 王泽一 on 15/5/4.
//  Copyright (c) 2015年 王泽一. All rights reserved.
//

#import "ViewController.h"
#import "BUDBTCentralManager.h"


@interface ViewController ()

@end

@implementation ViewController{
    UIButton* _scanButton;
    UIActivityIndicatorView* _indicatorView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _scanButton = [[UIButton alloc] init];
    [_scanButton setTitle:@"开始扫描蓝牙设备" forState:UIControlStateNormal];
    [_scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scanButton setBackgroundColor:[UIColor blueColor]];
    [_scanButton addTarget:self action:@selector(p_onScanButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_scanButton];
    
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_indicatorView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (CGRectEqualToRect(_scanButton.frame, CGRectZero)) {
        [_scanButton sizeToFit];
        _scanButton.frame = CGRectMake((self.view.bounds.size.width - _scanButton.bounds.size.width)/2, 200 , _scanButton.bounds.size.width, _scanButton.bounds.size.height);
        _scanButton.frame = CGRectInset(_scanButton.frame, -30, 0);
        _scanButton.layer.cornerRadius = 4;
        
        _indicatorView.frame = CGRectMake((self.view.bounds.size.width - _indicatorView.bounds.size.height) / 2, _scanButton.frame.origin.y + _scanButton.bounds.size.height + 20, _indicatorView.bounds.size.width, _indicatorView.bounds.size.height);
    }
}



@end
