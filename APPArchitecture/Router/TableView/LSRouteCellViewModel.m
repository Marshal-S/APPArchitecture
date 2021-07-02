//
//  LSRouteCellViewModel.m
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import "LSRouteCellViewModel.h"
#import <KVOController.h>

@interface LSRouteCellViewModel ()

@property (nonatomic, strong) FBKVOController *kvoController;

@end

@implementation LSRouteCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kvoController = [FBKVOController controllerWithObserver:self];
    }
    return self;
}

- (void)update {
//    //此模型里面的内容，可能会跨越多个界面，因此使用view与与其绑定，可以使得使用同一个模型的view在model更改后同时响应更改
    [_kvoController observe:self.coreModel keyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, LSRouterRowModel *_Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        self.coreView.titleLabel.text = object.name; // change[@"new"];
    }];
    //注意KVOControlelr并不会与self造成循环引用，注意block的持有者并不是self，而是_FBKVOInfo
    [_kvoController observe:self.coreModel keyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, LSRouterRowModel *_Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        self.coreView.contentLabel.text = object.content; // change[@"new"];;
    }];
    __weak typeof(self) wself = self;
    [self.coreView setOnTapBlock:^(MVCCell * _Nonnull cell) {
        [wself onClickToUpdate];
    }];
}

//更改不一定是在当前界面
- (void)onClickToUpdate {
    self.coreModel.name = [self.coreModel.name stringByAppendingString:@"更改"];
    self.coreModel.content = @"更改过的内容";
    if ([self.delegate respondsToSelector:@selector(onTapUpdate:)]) {
        [self.delegate onTapUpdate: self.coreModel];
    }
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
