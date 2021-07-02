//
//  LSRouterPresent.h
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import <UIKit/UIKit.h>
#import "LSRouterContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSRouterPresent : NSObject<LSRouteHeadViewDelegate>

@property (nonatomic, weak) id<LSRouteTableViewDelegate> delegate;

@property (nonatomic, weak) LSRouterContext *context;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *rowList;

- (UITableView *)loadTableView;

- (void)loadDataSource;

@end

NS_ASSUME_NONNULL_END
