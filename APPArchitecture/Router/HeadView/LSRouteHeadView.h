//
//  LSRouteHeadView.h
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSRouteHeadView : UIView

@property (nonatomic, strong) UILabel *lblHead;

@property (nonatomic, copy) void(^onUpdateBlock)(LSRouteHeadView *coreView);

@end

NS_ASSUME_NONNULL_END
