//
//  VC_Base.h
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar_Base.h"

@interface VC_Base : UIViewController

/**
 *  自定义navigationbar , 以便全屏返回
 */
@property (nonatomic, strong) NavigationBar_Base *jx_navigationBar;

/**
 *  自定义navagionitem的标题,需放在super方法执行之前
 */
@property (nonatomic, strong) NSString *jx_title;

/**
 *  标题颜色
 */
@property (nonatomic, strong) UIColor *jx_titleColor;

/**
 *  导航栏背景色
 */
@property (nonatomic, strong) UIColor *jx_background;

/**
 显示导航栏
 */
- (void)showNavigationBar;

/**
 隐藏导航栏
 */
- (void)hideNavigationBar;

/**
 *  设置navigation左边的item
 *
 *  @param item item description
 */
- (void) setNavigationBarLeftItem:(UIBarButtonItem *)item;

/**
 设置navigation左边的item
 
 @param title 显示的文字
 @param selector 调用的方法
 */
- (void)setNavigationBarLeftItemTitle:(NSString *)title selector:(SEL)selector;

- (void)addNavigationBarLeftItemTitle:(NSString *)title selector:(SEL)selector;

/**
 设置navigation右边的item
 
 @param title 显示的文字
 @param selector 调用的方法
 */
- (void)setNavigationBarRightItemTitle:(NSString *)title selector:(SEL)selector;

/**
 *  设置navigation右边的item
 *
 *  @param item item description
 */
- (void) setNavigationBarRightItem:(UIBarButtonItem *)item;

/**
 *  设置navigation右边的item
 *
 *  @param item item
 *  @param width 偏移量
 */
- (void) setNavigationBarRightItem:(UIBarButtonItem *)item spaceWidth:(NSInteger) width;

/**
 *  设置navigation的titleView
 *
 *  @param view view
 */
- (void)setNavigationBarTitleView:(UIView *)view;

/**
 关闭键盘
 */
- (void)endEditing;

/**
 *  如果需自定义返回按钮事件，实现该方法重写
 */
- (void)backPressed;

/**
 设置背景色
 
 @param color 背景颜色对象
 */
- (void)setBarBackColor:(UIColor *)color;

@end
