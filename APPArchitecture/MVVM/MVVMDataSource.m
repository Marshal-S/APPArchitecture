//
//  MVVMDataSource.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/24.
//

#import "MVVMDataSource.h"

@implementation MVVMDataSource

+ (void)getMVVMData:(void(^)(NSArray <MVVMModel *> *dataList))successBlock {
    NSMutableArray *list = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 100; idx++) {
        MVVMModel *model = [MVVMModel new];
        model.name = [NSString stringWithFormat:@"标题%ld", idx];
        model.content = [NSString stringWithFormat:@"MVVM内容%ld", idx];
        [list addObject:model];
    }
    successBlock(list);
}

@end
