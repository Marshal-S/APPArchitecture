//
//  MVPPresent.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "MVPPresent.h"

@interface MVPPresent ()

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation MVPPresent

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getDataSource];
    }
    return self;
}

- (void)getDataSource {
    [MVPDataSource getMVPData:^(NSArray<MVCModel *> * _Nonnull dataList) {
        //除了加载数据，数据内容的处理也可以在这里面，例如内容计算、筛选，当然根据业务和复杂度，可以再进一步封装划分
        self.dataList = dataList;
        [self.tableView reloadData];
    }];
}

- (void (^)(UITableView * _Nonnull, MVPCell * _Nonnull, NSIndexPath * _Nonnull))cellUpdateBlock {
    __weak typeof(self) wself = self;
    _cellUpdateBlock = ^(UITableView *tableView, MVPCell *cell, NSIndexPath *indexPath) {
        __strong typeof(self) sself = wself;
        MVPModel *model = sself.dataList[indexPath.row];
        cell.titleLabel.text = model.name;
        cell.contentLabel.text = model.content;
        
//        cell.clickDelegate = sself;
        //这里也可以实现点击的代理等相关操作业务相关问题，毕竟视图这里都可以访问的到
        [cell setOnTapBlock:^(MVCCell * _Nonnull cell) {
            [wself onChangeItem:model cell:cell indexPath:indexPath];
        }];
    };
    return _cellUpdateBlock;
}

- (void)onChangeItem:(MVPModel *)model cell:(MVCCell *)cell indexPath:(NSIndexPath *)indexPath {
    model.content = [NSString stringWithFormat:@"我是更改过的内容：%ld", indexPath.row];
    cell.contentLabel.text = model.content; //如果想要model改动的同时，自动更新View，则需要对view添加对model的监听，这种时候，mvp代码又会变得复杂
    [self.tableView reloadData];
}


@end
