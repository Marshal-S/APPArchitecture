//
//  MVCDataSource.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//  这个是datasouce获取的类，一般是网络请求，也可能为本地数据

#import <Foundation/Foundation.h>
#import "MVCModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVCDataSource : NSObject

+ (void)getMVCData:(void(^)(NSArray <MVCModel *> *dataList))successBlock;

@end

NS_ASSUME_NONNULL_END
