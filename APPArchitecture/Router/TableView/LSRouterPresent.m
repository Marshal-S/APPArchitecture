//
//  LSRouterPresent.m
//  APPArchitecture
//
//  Created by Marshal on 2021/7/1.
//

#import "LSRouterPresent.h"
#import "LSRouterCell.h"
#import "LSRouterDataSource.h"
#import "LSRouteCellViewModel.h"
#import "LSRouteHeaderModel.h"

static NSString *cellIdentifier = @"cellIdentifier";
static NSString *headIdentifier = @"headIdentifier";

@interface LSRouterPresent ()<UITableViewDataSource, UITableViewDelegate, LSTapUpdateDelegate>

@end

@implementation LSRouterPresent

- (UITableView *)loadTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MVCCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    return self.tableView;
}

- (void)loadDataSource {
    //这里为了方便展示结构，row使用的是同一串数据
    [LSRouterDataSource getRouterData:^(NSArray<LSRouterRowModel *> * _Nonnull rowList) {
        NSMutableArray *dataList = [NSMutableArray array];
        [rowList enumerateObjectsUsingBlock:^(LSRouterRowModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LSRouteCellViewModel *viewModel = [LSRouteCellViewModel new];
            viewModel.coreModel = obj;
            [dataList addObject:viewModel];
        }];
        self.rowList = dataList;
        
        [self.tableView reloadData];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowList ? self.rowList.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSRouterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //实际上一般是一个view对应一个viewModel，复用里面一般用的少，这里只是演示使用
    LSRouteCellViewModel *viewModel = self.rowList[indexPath.row];
    viewModel.coreView = cell;
    viewModel.delegate = self;
    [viewModel update];
    
    return cell;
}

- (void)onTapUpdate:(LSRouterRowModel *)rowModel {
    if ([self.delegate respondsToSelector:@selector(onUpdateWithRowModel:)]) {
        [self.delegate onUpdateWithRowModel:rowModel];
    }
}

//更新视图
- (void)onUpdateWithHeadModel:(LSRouteHeaderModel *)headModel {
    [self.rowList enumerateObjectsUsingBlock:^(LSRouteCellViewModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.coreModel.content = headModel.content;
    }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
