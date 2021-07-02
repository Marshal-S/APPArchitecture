//
//  LSRouterDataSource.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/30.
//

#import <Foundation/Foundation.h>
#import "LSRouterRowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSRouterDataSource : NSObject

+ (void)getRouterData:(void(^)(NSArray<LSRouterRowModel *> *rowList))successBlock;

@end

NS_ASSUME_NONNULL_END
