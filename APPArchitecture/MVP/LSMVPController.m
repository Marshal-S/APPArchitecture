//
//  LSMVPController.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "LSMVPController.h"
#import "MVPCell.h"
#import "MVPPresent.h"
#import "MVPDataSource.h"

static NSString *reuseIdentifier = @"resueMVPIdentifier";

@interface LSMVPController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MVPPresent *present;

@end

@implementation LSMVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupPresent];
    
    [self setupTableView];
}

//实际使用中，根据情况tableView也可以独立到view层中，如果代码不多，那么没必要
- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MVCCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    [self.view addSubview:self.tableView];
}

- (void)setupPresent {
    self.present = [[MVPPresent alloc] init];
    self.present.tableView = self.tableView;
    [self.present getDataSource];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.present && self.present.dataList ? self.present.dataList.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    //直接将赋值相关操作全部交给present，这些涉及到业务相关的内容
    self.present.cellUpdateBlock(tableView, cell, indexPath);
    return cell;
}

@end
