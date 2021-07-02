//
//  MVPDataSource.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//  这个是datasouce获取的类，一般是网络请求，也可能为本地数据

#import "MVPModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPDataSource : NSObject

+ (void)getMVPData:(void(^)(NSArray <MVPModel *> *dataList))successBlock;

@end

NS_ASSUME_NONNULL_END
