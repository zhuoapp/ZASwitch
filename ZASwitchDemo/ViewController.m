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
    
    _swBtn = ({
        ZASwitch * switchView = [[ZASwitch alloc]initWithFrame:CGRectMake(100, 100, 40, 40)];
        [self.view addSubview:switchView];
        switchView.isOn = NO;
        
        switchView.delegate = self;
        switchView.statusBlock = ^(ZASwitch * switchBtn){
            NSLog(@"statusBlock——%d",switchBtn.isOn);
        };
        
        switchView;
    });
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blackColor];
    btn.frame = CGRectMake(100, 300, 200, 30);
    [btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    [btn setTitle:@"改变颜色" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(changeSwitchOnColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZASwitch * switchView_1 = [[ZASwitch alloc]initWithFrame:CGRectMake(100, 200, 40, 40)];
    [self.view addSubview:switchView_1];
    [switchView_1 addTarget:self action:@selector(tapSW) forControlEvents:UIControlEventTouchUpInside];
    [switchView_1 addTarget:self action:@selector(tapSW:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeSwitchOnColor:(UIButton *)btn{
    
    btn.selected = !btn.selected;
    if (btn.selected) {
        _swBtn.onColor = [UIColor redColor];
    }
    else{
        _swBtn.offColor = [UIColor greenColor];
    }
}
#pragma mark -  ZASwitchDelegate
-(void)switchBtnStatuChanged:(ZASwitch *)switchBtn{
    NSLog(@"switchBtnStatuChanged——%d",switchBtn.isOn);
}
- (void)tapSW{
    
    NSLog(@"返回");
}

- (void)tapSW:(UIButton *)sw{

    NSLog(@"返回%d",sw.selected);
}

@end
