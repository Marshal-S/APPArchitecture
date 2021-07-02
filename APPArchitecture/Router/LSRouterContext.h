//
//  LSContext.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/30.
//

#import <Foundation/Foundation.h>
#import "LSRouterController.h"

NS_ASSUME_NONNULL_BEGIN

@class LSRouteHeaderModel, LSRouterRowModel;

@protocol LSRouteHeadViewDelegate <NSObject>

- (void)onUpdateWithHeadModel:(LSRouteHeaderModel *)headModel;

@end

@protocol LSRouteTableViewDelegate <NSObject>

- (void)onUpdateWithRowModel:(LSRouterRowModel *)rowModel;

@end



@class LSRouterController, LSRouterPresent, LSRouteHeadPresent;

@interface LSRouterContext : NSObject

@property (nonatomic, weak) LSRouterController *routerController;

@property (nonatomic, strong) LSRouterPresent *present;

@property (nonatomic, strong) LSRouteHeadPresent *headPresent;

@end

NS_ASSUME_NONNULL_END
