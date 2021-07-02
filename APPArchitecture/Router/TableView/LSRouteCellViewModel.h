//
//  LSRouteCellViewModel.h
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "LSRouterCell.h"
#import "LSRouterRowModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LSTapUpdateDelegate <NSObject>

@optional
- (void)onTapUpdate:(LSRouterRowModel *)rowModel;

@end

@interface LSRouteCellViewModel : NSObject

@property (nonatomic, strong) LSRouterRowModel *coreModel;
@property (nonatomic, strong) LSRouterCell *coreView;

@property (nonatomic, weak) id<LSTapUpdateDelegate> delegate;

- (void)update;

@end

NS_ASSUME_NONNULL_END
