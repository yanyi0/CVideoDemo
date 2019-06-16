//
//  ViewController.m
//  CVideoDemo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import "ViewController.h"
#import <CVideo/CVideo.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, self.view.frame.size.width, 30);
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)btnClick:(UIButton *)sender
{
    [[CVideoManager sharedInstance] playVideoWithViewController:self];
}
@end
