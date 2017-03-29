//
//  ViewController.m
//  swtichBtn
//
//  Created by ZhuoApp on 2017/3/29.
//  Copyright © 2017年 ZhuoApp. All rights reserved.
//

#import "ViewController.h"
#import "ZASwitch.h"

@interface ViewController ()<ZASwitchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZASwitch * sw = [[ZASwitch alloc]initWithFrame:CGRectMake(100, 100, 40, 40)];
    [self.view addSubview:sw];
    sw.isOn = NO;
    
    sw.delegate = self;
    sw.statusBlock = ^(ZASwitch * btn){
        NSLog(@"statusBlock——%d",btn.isOn);
    };
    
    UISwitch * sww = [[UISwitch alloc]initWithFrame:CGRectMake(200, 100, 70, 70)];
    [self.view addSubview:sww];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)switchBtnStatuChanged:(ZASwitch *)switchBtn{
        NSLog(@"switchBtnStatuChanged——%d",switchBtn.isOn);
}

@end
