//
//  AppDelegate.m
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:ScreenFrame];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //日志打开
    [MTLogUtil logOpen];
    //处理根控制器，是主页还是登陆
    [self layoutRootController];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - root controller
- (void)layoutRootController {
    BOOL isLogin = YES;
    if (isLogin) {
        VC_MainTabBar *vc_mainTab = [[VC_MainTabBar alloc] init];
        self.mainTab = vc_mainTab;
        self.window.rootViewController = vc_mainTab;
    } else {
        UINavigationController *nvc_login = [[MTMediator sharedInstance] performSBTarget:@"NVC_Login" parameter:nil sbName:SB_LOGIN];
        self.window.rootViewController = nvc_login;
    }
}


@end
