//
//  ViewController.m
//  ZASwitchDemo
//
//  Created by ZhuoApp on 2017/3/30.
//  Copyright © 2017年 ZhuoApp. All rights reserved.
//

#import "ViewController.h"
#import "ZASwitch.h"

@interface ViewController ()<ZASwitchDelegate>
{
    ZASwitch * _swBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZASwitch * switchView = [[ZASwitch alloc]initWithFrame:CGRectMake(100, 100, 40, 40)];
    [self.view addSubview:switchView];
    switchView.isOn = NO;
    
    switchView.delegate = self;
    switchView.statusBlock = ^(ZASwitch * switchBtn){
        NSLog(@"statusBlock——%d",switchBtn.isOn);
    };
    
    [switchView setStatusChangedBlock:^(ZASwitch *switchBtn) {
        
    }];
    
    _swBtn = switchView;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blackColor];
    btn.frame = CGRectMake(100, 300, 200, 30);
    [btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeSwitchColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changeSwitchColor{
    
    _swBtn.onColor = [UIColor redColor];
}
#pragma mark -  ZASwitchDelegate
-(void)switchBtnStatuChanged:(ZASwitch *)switchBtn{
    NSLog(@"switchBtnStatuChanged——%d",switchBtn.isOn);
}
@end
