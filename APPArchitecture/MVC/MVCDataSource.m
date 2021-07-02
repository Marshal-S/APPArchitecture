//
//  MVCDataSource.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "MVCDataSource.h"

@implementation MVCDataSource

+ (void)getMVCData:(void(^)(NSArray <MVCModel *> *dataList))successBlock {
    NSMutableArray *list = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 100; idx++) {
        MVCModel *model = [MVCModel new];
        model.name = [NSString stringWithFormat:@"标题%ld", idx];
        model.content = [NSString stringWithFormat:@"MVC内容%ld", idx];
        [list addObject:model];
    }
    successBlock(list);
}

@end
