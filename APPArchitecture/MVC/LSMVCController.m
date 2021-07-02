//
//  LSMVCController.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "LSMVCController.h"
#import "MVCCell.h"
#import "MVCDataSource.h"

static NSString *reuseIdentifier = @"resueMVPIdentifier";

@interface LSMVCController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation LSMVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self getDataSource];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MVCCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.tableView];
}

- (void)getDataSource {
    [MVCDataSource getMVCData:^(NSArray<MVCModel *> * _Nonnull dataList) {
        self.dataList = dataList;
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVCCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    //也有将model直接嵌入view中，但是不推荐，UI更改应当相对独立一些，控制器做控制器要做的事情，模型做模型的事情
    
    MVCModel *model = _dataList[indexPath.row];
    cell.titleLabel.text = model.name;
    cell.contentLabel.text = model.content;
    __weak typeof(self) wself = self;
    [cell setOnTapBlock:^(MVCCell * _Nonnull cell) {
        [wself onChanged];
    }];
    
    return cell;
}

- (void)onChanged {
    NSLog(@"哈哈哈哈哈");
}



@end
