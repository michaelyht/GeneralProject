//
//  VC_MainTabBar.m
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import "VC_MainTabBar.h"

@interface VC_MainTabBar ()

@end

@implementation VC_MainTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private mehtods
- (void)layoutUI{
    [self initTabs];
    [self layoutTabs];
    
    [self.tabBar setBackgroundImage:[UIImage mt_imageWithColor:[UIColor whiteColor]]];
    [self.tabBar setShadowImage:[UIImage mt_imageWithColor:[UIColor whiteColor]]];
}

- (void)initTabs{
    NSMutableArray *arr_vc = [NSMutableArray arrayWithCapacity:4];
    UIStoryboard *sb_one = [UIStoryboard storyboardWithName:SB_ONE bundle:nil];
    UIStoryboard *sb_two = [UIStoryboard storyboardWithName:SB_TWO bundle:nil];
    UIStoryboard *sb_three = [UIStoryboard storyboardWithName:SB_THREE bundle:nil];
    UIStoryboard *sb_four = [UIStoryboard storyboardWithName:SB_FOUR bundle:nil];
    
    UINavigationController *nav_one = [sb_one instantiateInitialViewController];
    nav_one.title = @"one";
    UINavigationController *nav_two = [sb_two instantiateInitialViewController];
    nav_two.title = @"two";
    UINavigationController *nav_three = [sb_three instantiateInitialViewController];
    nav_three.title = @"three";
    UINavigationController *nav_four = [sb_four instantiateInitialViewController];
    nav_four.title = @"four";
    
    [arr_vc addObject:nav_one];
    [arr_vc addObject:nav_two];
    [arr_vc addObject:nav_three];
    [arr_vc addObject:nav_four];
    
    [self setViewControllers:arr_vc];
}

- (void)layoutTabs{
    UITabBarItem *item = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:3];
    
    [item setTitleTextAttributes:[self itemAttribute] forState:UIControlStateSelected];
    [item setImage:[[UIImage imageNamed:@"tab_one_nol"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[[UIImage imageNamed:@"tab_one_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [item1 setTitleTextAttributes:[self itemAttribute] forState:UIControlStateSelected];
    [item1 setImage:[[UIImage imageNamed:@"tab_two_nol"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item1 setSelectedImage:[[UIImage imageNamed:@"tab_two_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [item2 setTitleTextAttributes:[self itemAttribute] forState:UIControlStateSelected];
    [item2 setImage:[[UIImage imageNamed:@"tab_three_nol"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item2 setSelectedImage:[[UIImage imageNamed:@"tab_three_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [item3 setTitleTextAttributes:[self itemAttribute] forState:UIControlStateSelected];
    [item3 setImage:[[UIImage imageNamed:@"tab_four_nol"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item3 setSelectedImage:[[UIImage imageNamed:@"tab_four_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    /* 设置字体大小  */
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor tt_colorWithHexString:@"FF344D"], NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:10.0],NSFontAttributeName,nil] forState:UIControlStateHighlighted];
    //
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor tt_colorWithHexString:@"373737"], NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:10.0], NSFontAttributeName,nil] forState:UIControlStateNormal];
}

- (NSDictionary *)itemAttribute {
    UIColor *selectTitleColor = [UIColor mt_colorWithHexString:@"FF344D"];
    return @{NSForegroundColorAttributeName: selectTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:10]};
}


@end
