//
//  CVideoViewController.h
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CVideoViewController : UIViewController
@property (nonatomic, strong, readonly) WKWebView *wkWebView;
@property (copy, nonatomic) NSString *originURLString;
- (instancetype)initWithURLString:(NSString *)originURLString;
@end

NS_ASSUME_NONNULL_END
