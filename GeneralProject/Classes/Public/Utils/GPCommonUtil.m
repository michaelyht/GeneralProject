//
//  GPCommonUtil.m
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import "GPCommonUtil.h"
#import "VC_MainTabBar.h"

@implementation GPCommonUtil

+ (void)setRootViewWithLogin {
    UINavigationController *nvc_login = [[MTMediator sharedInstance] performSBTarget:@"NVC_Login" parameter:nil sbName:SB_LOGIN];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = nvc_login;
    CATransition *myTransition = [CATransition animation];//创建CATransition
    myTransition.duration = 0.25;//持续时长0.25秒
//    myTransition.timingFunction = UIViewAnimationCurveEaseInOut;//计时函数，从头到尾的流畅度
    myTransition.type = kCATransitionFade;
    [window.layer addAnimation:myTransition forKey:nil];
}

+ (void)setRootViewWithMain {
    VC_MainTabBar *main = [VC_MainTabBar new];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = main;
    CATransition *myTransition = [CATransition animation];//创建CATransition
    myTransition.duration = 0.25;//持续时长0.25秒
//    myTransition.timingFunction = UIViewAnimationCurveEaseInOut;//计时函数，从头到尾的流畅度
    myTransition.type = kCATransitionFade;
    [window.layer addAnimation:myTransition forKey:nil];
}

/**
 弹框提示重新登录
 */
+ (void)reLogin{
    [MTAlertUtil showAlertWithTitle:nil
                            message:@"登录失效，请重新登录"
                  cancleButtonTitle:@"知道了"
                  OtherButtonsArray:@[]
                   showInController: [AppInfoUtil getCurrentViewConttoller]
                       clickAtIndex:^(NSInteger buttonIndex) {
                           NSLog(@"退出登录需要处理的事情");
                       }];
}

@end
