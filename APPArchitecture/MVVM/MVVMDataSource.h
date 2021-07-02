//
//  MVVMDataSource.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/24.
//

#import "MVVMModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVMDataSource : NSObject

+ (void)getMVVMData:(void(^)(NSArray <MVVMModel *> *dataList))successBlock;

@end

NS_ASSUME_NONNULL_END
