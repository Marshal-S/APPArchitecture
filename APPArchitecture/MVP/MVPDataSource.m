//
//  MVPDataSource.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "MVPDataSource.h"

@implementation MVPDataSource

+ (void)getMVPData:(void(^)(NSArray <MVPModel *> *dataList))successBlock {
    NSMutableArray *list = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 100; idx++) {
        MVPModel *model = [MVPModel new];
        model.name = [NSString stringWithFormat:@"标题%ld", idx];
        model.content = [NSString stringWithFormat:@"MVP内容%ld", idx];
        [list addObject:model];
    }
    successBlock(list);
}

@end
