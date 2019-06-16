//
//  CVideoManager.m
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import "CVideoManager.h"
#import "CVideoViewController.h"
static CVideoManager *_instance = nil;
@implementation CVideoManager
+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    return [CVideoManager sharedInstance];
}
-(id)copyWithZone:(NSZone *)zone
{
    return [CVideoManager sharedInstance];
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return [CVideoManager sharedInstance];
}
-(void)playVideoWithViewController:(UIViewController *)viewController
{
    NSLog(@"播放视频!");
    CVideoViewController *videoVC = [[CVideoViewController alloc] initWithURLString:@"https://www.jianshu.com/u/226468ea6565"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:videoVC];
    [viewController presentViewController:nav animated:YES completion:nil];
}
@end
