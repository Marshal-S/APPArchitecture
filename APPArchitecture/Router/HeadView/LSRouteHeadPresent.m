//
//  LSRouteHeadPresent.m
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import "LSRouteHeadPresent.h"

@implementation LSRouteHeadPresent

- (UIView *)loadHeadViewWithFrame:(CGRect)frame {
    self.coreView = [[LSRouteHeadView alloc] initWithFrame:frame];
    __weak typeof(self) wself = self;
    [self.coreView setOnUpdateBlock:^(LSRouteHeadView * _Nonnull coreView) {
        [wself onClickToUpdateAllCell];
    }];
    return self.coreView;
}

- (void)loadDataSouce {
    self.coreModel = [[LSRouteHeaderModel alloc] init];
    self.coreModel.name = @"我是测试的标题内容";
    self.coreModel.content = @"我是测试的副标题内容，这部分可以更新或者使用";
    
    self.coreView.lblHead.text = self.coreModel.name;
}

- (void)onClickToUpdateAllCell {
    if ([self.delegate respondsToSelector:@selector(onUpdateWithHeadModel:)]) {
        [self.delegate onUpdateWithHeadModel:self.coreModel];
    }
    
}

- (void)onUpdateWithRowModel:(LSRouterRowModel *)rowModel {
    self.coreView.lblHead.text = rowModel.name;
    NSLog(@"LSRouterRowModel-content:%@", rowModel.content);
}

@end
