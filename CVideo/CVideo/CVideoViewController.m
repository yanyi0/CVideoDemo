//
//  CVideoViewController.m
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//
#import "CVideoViewController.h"
#import "CVideoAddAreaButton.h"
#import "CVideoBundle.h"
#define kCVideoScreenWidth [UIScreen mainScreen].bounds.size.width
#define kCVideoScreenHeight [UIScreen mainScreen].bounds.size.height
#define KCVideoNavgationBarHeight   44.0f
#define kCVideoTabBarHeight (iPhoneX ? 83.0f : 49.0f)
#define kCVideoStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
@interface CVideoViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) NSURL *originURL;
@property (strong, nonatomic) NSURLConnection *urlConnection;
@property (strong, nonatomic) NSURLRequest * request;
@property (strong, nonatomic) CVideoAddAreaButton *closeButton;
@end

@implementation CVideoViewController
- (instancetype)initWithURLString:(NSString *)originURLString
{
    self = [super init];
    
    if (self)
    {
        [self setOriginURLString:originURLString];
    }
    
    return self;
}
- (void)loadRequestWithURLString:(NSString *)URLString
{
    if (URLString) {
        NSURL * url = [NSURL URLWithString:URLString];
        
        if (!url) {
            NSString *encodedString = [self getUTF8EncodeStringWithURLString:URLString];
            url = [NSURL URLWithString:encodedString];
        }
        
        [self loadRequestWithURL:url];
    }
}

- (void)loadRequestWithURL:(NSURL *)URL
{
    if (URL)
    {
        NSMutableURLRequest * request =
        [NSMutableURLRequest requestWithURL:URL
                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                            timeoutInterval:10];
        _request = request;
        [_wkWebView loadRequest:_request];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackNaviBar];
    [self initWKWebView];
    [self loadRequestWithURL:_originURL];
}
-(void)setupBackNaviBar
{
    self.navigationItem.leftBarButtonItem = nil;
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    CVideoAddAreaButton *backButton=[CVideoAddAreaButton buttonWithType:UIButtonTypeCustom];
    backButton.shouldExpandClickArea = YES;
    [backButton setFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:[CVideoBundle CVideoImageWithName:@"icon_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onNaviBack) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:backButton];
    
    self.closeButton=[CVideoAddAreaButton buttonWithType:UIButtonTypeCustom];
    self.closeButton.shouldExpandClickArea = NO;
    [self.closeButton setFrame:CGRectMake(32, 0, 44, 44)];
    [self.closeButton setImage:[CVideoBundle CVideoImageWithName:@"icon_close"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.closeButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backView];
}
- (void)initWKWebView
{
    WKWebViewConfiguration* webViewConfig = WKWebViewConfiguration.new;
    webViewConfig.allowsInlineMediaPlayback = YES;
    
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kCVideoScreenWidth, kCVideoScreenHeight - kCVideoStatusBarHeight - KCVideoNavgationBarHeight) configuration:webViewConfig];
    
    wkWebView.navigationDelegate = self;
    wkWebView.UIDelegate = self;
    _wkWebView = wkWebView;
    [self.view addSubview:_wkWebView];
}
-(void)onNaviBack{
    WKBackForwardList *list =  [self.wkWebView backForwardList];
    NSArray *arr = list.backList;
    
    if ([self.wkWebView canGoBack] && arr.count > 1) {
        [self.wkWebView goBack];
    } else {
        [self.wkWebView stopLoading];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark - action
- (void)closeButtonClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSString *)getUTF8EncodeStringWithURLString:(NSString *)urlString
{
    if (urlString && urlString.length > 0)
    {
        NSString *encodedString = (NSString *)
        CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                  (CFStringRef)urlString,
                                                                  (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                  NULL,
                                                                  kCFStringEncodingUTF8));
        return encodedString;
    }
    else
    {
        return @"";
    }
}
-(void)setOriginURLString:(NSString *)originURLString
{
    if (originURLString && originURLString.length > 0)
    {
        _originURLString = originURLString;
        _originURL = [NSURL URLWithString:_originURLString];
        
        if (!_originURL)
        {
            NSString *encodedString = [self getUTF8EncodeStringWithURLString:originURLString];
            _originURL = [NSURL URLWithString:encodedString];
        }
    }
}
@end
