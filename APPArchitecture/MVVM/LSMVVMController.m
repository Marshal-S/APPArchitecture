//
//  LSMVVMController.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "LSMVVMController.h"
#import "MVVMDataSource.h"
#import "MVVMViewModel.h"

static NSString *reuseIdentifier = @"resueMVVMIdentifier";

@interface LSMVVMController ()<UITableViewDataSource, UITableViewDelegate, navigateTestDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <MVVMViewModel *> *viewModelList;

@end

@implementation LSMVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModelList = [NSMutableArray array];
    
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
    [MVVMDataSource getMVVMData:^(NSArray<MVVMModel *> * _Nonnull dataList) {
        [dataList enumerateObjectsUsingBlock:^(MVVMModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MVVMViewModel *viewModel = [MVVMViewModel new];
            viewModel.coreModel = obj;
            [self.viewModelList addObject:viewModel];
        }];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModelList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVVMCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //实际上一般是一个view对应一个viewModel，复用里面一般用的少，这里只是演示使用
    MVVMViewModel *viewModel = self.viewModelList[indexPath.row];
    viewModel.coreView = cell;
    
    viewModel.delegate = self;
    
    [viewModel update];
    
    return cell;
}

//长按跳转，这个是viewModel和controller之间的交互
- (void)navigateMVVMController {
    LSMVVMController *testNewVC = [LSMVVMController new];
    [self presentViewController:testNewVC animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [testNewVC dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
