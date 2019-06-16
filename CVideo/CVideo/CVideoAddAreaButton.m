//
//  CVideoAddAreaButton.m
//  CVideo
//
//  Created by Cloud on 2019/6/16.
//  Copyright © 2019 cloud. All rights reserved.
//

#import "CVideoAddAreaButton.h"

@implementation CVideoAddAreaButton
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _shouldExpandClickArea = YES;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _shouldExpandClickArea = YES;
    }
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.shouldExpandClickArea) {
        CGRect bounds = self.bounds;
        bounds = CGRectInset(bounds, -64, -64);
        return CGRectContainsPoint(bounds, point);
    }
    return [super pointInside:point withEvent:event];
}

-(void)setFrame:(CGRect)frame{
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [super setFrame:frame];
}

@end
