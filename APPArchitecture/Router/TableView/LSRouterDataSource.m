//
//  LSRouterDataSource.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/30.
//

#import "LSRouterDataSource.h"

@implementation LSRouterDataSource

+ (void)getRouterData:(void(^)(NSArray<LSRouterRowModel *> *rowList))successBlock {
    NSMutableArray *rowList = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 100; idx++) {
        LSRouterRowModel *model = [LSRouterRowModel new];
        model.name = [NSString stringWithFormat:@"row标题%ld", idx];
        model.content = [NSString stringWithFormat:@"row内容%ld", idx];
        [rowList addObject:model];
    }
    successBlock(rowList);
}

@end
