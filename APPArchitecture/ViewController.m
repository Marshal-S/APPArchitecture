//
//  ViewController.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "ViewController.h"
#import "LSMVCController.h"
#import "LSMVPController.h"
#import "LSMVVMController.h"
#import "LSRouterController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *itemsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initPageController];
}

- (void)initPageController {
    UIViewController *mvc = [[LSMVCController alloc] init];
    UIViewController *mvp = [[LSMVPController alloc] init];
    UIViewController *mvvm = [[LSMVVMController alloc] init];
    UIViewController *route = [[LSRouterController alloc] init];
    
    [self addChildViewController:mvc];
    [self addChildViewController:mvp];
    [self addChildViewController:mvvm];
    [self addChildViewController:route];
    
    _scrollView.contentSize = CGSizeMake( [UIScreen mainScreen].bounds.size.width * 4, [UIScreen mainScreen].bounds.size.height - 88);
    
    [self showChildrenViewsWithScrollView:_scrollView];
}
//减速时的回调
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self showChildrenViewsWithScrollView:scrollView];
}

//调用动画滚动的回调，其他情况不回调
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self showChildrenViewsWithScrollView:scrollView];
}

//停止拖拽的时候的回调
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) [self showChildrenViewsWithScrollView:scrollView];
}

- (void)showChildrenViewsWithScrollView:(UIScrollView *)scrollView {
    CGFloat width = _scrollView.frame.size.width;
    
    CGFloat percentX =  scrollView.contentOffset.x / width;
    CGFloat index = (NSInteger)percentX;
    NSInteger page = percentX - index > 0.5 ? index + 1 : index;;
    
    UIViewController *child = self.childViewControllers[page];
    if (!child) return;
    if (![child isViewLoaded]) {
        child.view.frame = CGRectMake(_scrollView.frame.size.width * page, 0, width, _scrollView.frame.size.height);
        [scrollView addSubview:child.view];
    }
    
    [_itemsView.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = idx == page;
    }];
}

- (IBAction)onPageChanged:(UIButton *)sender {
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width * sender.tag, 0) animated:YES];
}


@end
