//
//  MVPPresent.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//  与UI和Model交互的业务处理方面都在这里

#import "MVPCell.h"
#import "MVPDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPPresent : NSObject

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong, readonly) NSArray *dataList;

@property (nonatomic, strong) void(^cellUpdateBlock)(UITableView *tableView, MVPCell *cell, NSIndexPath *indexPath);

- (void)getDataSource;

@end

NS_ASSUME_NONNULL_END
