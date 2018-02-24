//
//  VC_Base.m
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import "VC_Base.h"
#import "UINavigationBar+MTExtBGColor.h"

@interface VC_Base ()

@end

@implementation VC_Base

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addToolbar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppInfoUtil setStatusBarDefault];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 显示导航栏
 */
- (void)showNavigationBar {
    self.jx_navigationBar.hidden = NO;
}

/**
 隐藏导航栏
 */
- (void)hideNavigationBar {
    self.jx_navigationBar.hidden = YES;
}

- (void) setNavigationBarLeftItem:(UIBarButtonItem *)item {
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:self
                                                                               action:nil];
    flexSpacer.width = -10;
    self.jx_navigationBar.items.firstObject.leftBarButtonItems = [NSArray arrayWithObjects:flexSpacer,item, nil];
}

- (void) setNavigationBarRightItem:(UIBarButtonItem *)item {
    [self setNavigationBarRightItem:item spaceWidth:0];
}

/**
 设置navigation左边的item
 
 @param title 显示的文字
 @param selector 调用的方法
 */
- (void)setNavigationBarLeftItemTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    [item setTintColor:[UIColor mt_colorWithHexString:@"030303"]];
    [self setNavigationBarLeftItem:item];
}

- (void)addNavigationBarLeftItemTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    [item setTintColor:[UIColor mt_colorWithHexString:@"030303"]];
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.jx_navigationBar.items.firstObject.leftBarButtonItems];
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:self
                                                                               action:nil];
    flexSpacer.width = 10;
    [array addObjectsFromArray:@[flexSpacer, item]];
    self.jx_navigationBar.items.firstObject.leftBarButtonItems = array;
}

/**
 设置navigation右边的item
 
 @param title 显示的文字
 @param selector 调用的方法
 */
- (void)setNavigationBarRightItemTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    [item setTintColor:[UIColor mt_colorWithHexString:@"030303"]];
    [self setNavigationBarRightItem:item];
}

- (void) setNavigationBarRightItem:(UIBarButtonItem *)item spaceWidth:(NSInteger) width {
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:self
                                                                               action:nil];
    flexSpacer.width = width;
    [self.jx_navigationBar.items.firstObject setRightBarButtonItems:[NSArray arrayWithObjects:flexSpacer,item, nil]];
}

- (void)setNavigationBarTitleView:(UIView *)view {
    self.jx_navigationBar.items.firstObject.titleView = view;
}

/**
 关闭键盘
 */
- (void)endEditing {
    [self.view endEditing:YES];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - private method
- (void)addToolbar {
    self.jx_navigationBar = [[NavigationBar_Base alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 64)];
    self.jx_navigationBar.barTintColor = [UIColor mt_colorWithHexString:@"EBEBEB"];
    self.jx_navigationBar.shadowImage = [UIImage mt_imageWithColor:[UIColor mt_colorWithHexString:@"EBEBEB"]];
    [self.view addSubview:self.jx_navigationBar];
    UINavigationItem *item = [[UINavigationItem alloc] init];
    self.jx_navigationBar.items = @[item];
    //添加返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        if (IOS11Later) {
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            backButton.frame = CGRectMake(0, 0, 24, 44);
            [backButton setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
            [backButton setContentMode:UIViewContentModeCenter];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
            [backButton addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                       target:self
                                                                                       action:nil];
            flexSpacer.width = -15;
            item.leftBarButtonItems = [NSArray arrayWithObjects:flexSpacer, backItem, nil];
        } else {
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            backButton.frame = CGRectMake(0, 0, 44, 44);
            [backButton setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
            [backButton setContentMode:UIViewContentModeCenter];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
            [backButton addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                       target:self
                                                                                       action:nil];
            flexSpacer.width = -15;
            item.leftBarButtonItems = [NSArray arrayWithObjects:flexSpacer, backItem, nil];
        }
    }
}

#pragma mark - getters and setters
- (void)setJx_title:(NSString *)jx_title {
    _jx_title = jx_title;
    self.jx_navigationBar.items.firstObject.title = jx_title;
}

- (void)setJx_titleColor:(UIColor *)jx_titleColor {
    _jx_titleColor = jx_titleColor;
    [self.jx_navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: jx_titleColor}];
}

- (void)setJx_background:(UIColor *)jx_background {
    _jx_background = jx_background;
    [self.jx_navigationBar mt_setBackgroundColor:jx_background];
    
    [self configIOSEleven];
}

- (void)configIOSEleven {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.jx_navigationBar.overlay.bounds))];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:17];
        label.textColor = _jx_titleColor;
        label.text = _jx_title;
        [self.jx_navigationBar.overlay addSubview:label];
    }
}

- (void)setBarBackColor:(UIColor *)color {
    for (UIView *view in self.jx_navigationBar.subviews) {
        if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            view.backgroundColor = color;
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
