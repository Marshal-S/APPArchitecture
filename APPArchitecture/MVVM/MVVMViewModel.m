//
//  MVVMViewModel.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/24.
//

#import "MVVMViewModel.h"
#import <KVOController.h>

@interface MVVMViewModel ()

@property (nonatomic, strong) FBKVOController *kvoController;

@end

@implementation MVVMViewModel

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
    [_kvoController observe:self.coreModel keyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, MVVMModel *_Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        self.coreView.titleLabel.text = object.name; // change[@"new"];
    }];
    //注意KVOControlelr并不会与self造成循环引用，注意block的持有者并不是self，而是_FBKVOInfo
    [_kvoController observe:self.coreModel keyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, MVVMModel *_Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        self.coreView.contentLabel.text = object.content; // change[@"new"];;
    }];
    __weak typeof(self) wself = self;
    [self.coreView setOnTapBlock:^(MVCCell * _Nonnull cell) {
        [wself onClickToUpdate];
    }];
    
    [self.coreView setOnLongPressBlock:^(MVCCell * _Nonnull cell) {
        if ([wself.delegate respondsToSelector:@selector(navigationController)] ) {
            [wself.delegate navigateMVVMController];
        }
    }];
}

//更改不一定是在当前界面
- (void)onClickToUpdate {
    self.coreModel.name = @"更改的标题";
    self.coreModel.content = @"更改过的内容";
}

@end
