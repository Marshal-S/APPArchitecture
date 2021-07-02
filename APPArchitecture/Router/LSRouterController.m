//
//  LSRouterController.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "LSRouterController.h"
#import "LSRouterContext.h"
#import "LSRouterPresent.h"
#import "LSRouteHeadPresent.h"
#import "LSRouteCellViewModel.h"

@interface LSRouterController ()

@property (nonatomic, strong) LSRouterContext *context;

@end

@implementation LSRouterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)setup {
    self.context = [[LSRouterContext alloc] init];
    self.context.routerController = self;
    
    //初始化头部视图相关
    self.context.headPresent = [[LSRouteHeadPresent alloc] init];
    self.context.headPresent.context = self.context;
    
    UIView *headView = [self.context.headPresent loadHeadViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [self.view addSubview:headView];
    
    //加载数据
    [self.context.headPresent loadDataSouce];
    
    //初始化表格视图
    self.context.present = [[LSRouterPresent alloc] init];
    self.context.present.context = self.context;
    
    UIView *homeView = [self.context.present loadTableView];
    homeView.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50);
    [self.view addSubview:homeView];
    
    //加载数据
    [self.context.present loadDataSource];
    
    //设置代理关系，有利于交互
    self.context.present.delegate = self.context.headPresent;
    self.context.headPresent.delegate = self.context.present;
}

- (void)navigateMVVMController {
    LSRouterController *testNewVC = [LSRouterController new];
    [self presentViewController:testNewVC animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [testNewVC dismissViewControllerAnimated:YES completion:nil];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
