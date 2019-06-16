//
//  CVideoBundle.m
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import "CVideoBundle.h"

@implementation CVideoBundle
+ (NSString *)CVideoBundlePathForResource:(NSString *)name ofType:(NSString *)type {
    NSString *bundlePath = [self getCVideoBundlePath];
    return [[NSBundle bundleWithPath:bundlePath] pathForResource:name ofType:type];
}

+ (UIImage *)CVideoImageWithName:(NSString *)name {
    //bundle放入framework中，framework嵌入embeded binaries中的图片路径
    name = [NSString stringWithFormat:@"%@@%dx", name, (int)[UIScreen mainScreen].scale];
//    NSString *imagePath = [CVideoBundle CVideoBundlePathForResource:name ofType:@"png"];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    //bundle单独拖入Demo中的bundle路径
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@",[self getCVideoBundlePath],name];
    UIImage *image = [UIImage imageNamed:imagePath];
    return image;
}

+ (NSString *)getCVideoBundlePath {
    static NSString *bundlePath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //bundle放入framework中，framework嵌入embeded binaries中的bundle路径
//        bundlePath = [[NSBundle mainBundle] pathForResource:@"Frameworks/CVideo.framework/CVideo" ofType:@"bundle"];
        //bundle单独拖入Demo中的bundle路径
        bundlePath = [[NSBundle mainBundle] pathForResource:@"CVideo" ofType:@"bundle"];
    });
    return bundlePath;
}
@end
