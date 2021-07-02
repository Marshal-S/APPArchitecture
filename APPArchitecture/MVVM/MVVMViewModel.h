//
//  MVVMViewModel.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/24.
//

#import "MVVMModel.h"
#import "MVVMCell.h"

NS_ASSUME_NONNULL_BEGIN

//长按跳转，这个是viewModel和controller之间的交互
@protocol navigateTestDelegate <NSObject>

- (void)navigateMVVMController;

@end

@interface MVVMViewModel : NSObject

@property (nonatomic, strong) MVVMModel *coreModel;
@property (nonatomic, strong) MVVMCell *coreView;

@property (nonatomic, weak) id<navigateTestDelegate> delegate;

- (void)update;

@end

NS_ASSUME_NONNULL_END
