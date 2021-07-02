//
//  LSRouteHeadPresent.h
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "LSRouterContext.h"
#import "LSRouteHeadView.h"
#import "LSRouteHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSRouteHeadPresent : NSObject<LSRouteTableViewDelegate>

@property (nonatomic, weak) id<LSRouteHeadViewDelegate> delegate;

@property (nonatomic, weak) LSRouterContext *context;

@property (nonatomic, strong) LSRouteHeadView *coreView;

@property (nonatomic, strong) LSRouteHeaderModel *coreModel;

- (UIView *)loadHeadViewWithFrame:(CGRect)frame;

- (void)loadDataSouce;

@end

NS_ASSUME_NONNULL_END
