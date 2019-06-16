//
//  CVideoBundle.h
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CVideoBundle : NSObject
+ (NSString *)CVideoBundlePathForResource:(NSString *)name ofType:(NSString *)type;
+ (UIImage *)CVideoImageWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
