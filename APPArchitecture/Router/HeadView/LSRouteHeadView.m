//
//  LSRouteHeadView.m
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import "LSRouteHeadView.h"

@implementation LSRouteHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupWithFrame:frame];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame {
    self.lblHead = [[UILabel alloc] initWithFrame:frame];
    self.lblHead.textColor = [UIColor blackColor];
    self.lblHead.textAlignment = NSTextAlignmentCenter;
    self.lblHead.font = [UIFont systemFontOfSize:24];
    [self addSubview:self.lblHead];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self addGestureRecognizer:tap];
}

- (void)onTap {
    if (self.onUpdateBlock) self.onUpdateBlock(self);
}

@end
