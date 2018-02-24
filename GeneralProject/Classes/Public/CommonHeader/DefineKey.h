//
//  DefineKey.h
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#ifndef DefineKey_h
#define DefineKey_h

#define SB_ONE      @"SB_One"
#define SB_TWO      @"SB_Two"
#define SB_THREE    @"SB_Three"
#define SB_FOUR     @"SB_Four"
#define SB_LOGIN    @"SB_Login"

/*-------------储存的信息key----------------*/
#define USER_INFOMATION(key) ([[NSUserDefaults standardUserDefaults] valueForKey:key])
static NSString *const kNoFirstEnter = @"kNoFirstEnter";//第一次进应用，新特性页面使用

/*--------------页面参数传递-----------------*/
//房屋对象
#define kParameterHouse @"ParameterHouse"

/*--------------表格菜单定义-----------------*/
#define kCellKey @"CellKey"
#define kCellImage @"CellImage"
#define kCellText @"CellText"
#define kCellDeatial @"kCellDeatial"

#define TTMenu(key, image, text) @{kCellKey: key, kCellImage: (image == nil ? @"" : [UIImage imageNamed:image]), kCellText: text}
#define TTMenu_Setting(key, image, text, detail) @{kCellKey: key, kCellImage: (image == nil ? @"" : [UIImage imageNamed:image]), kCellText: text, kCellDeatial:detail}

/*------------------通知--------------------*/
//支付宝支付回调的通知
#define Notification_AliPayResp  @"Notification_AliPayResp"

/*----------------占位图片-------------------*/
//个人头像占位图
#define ImagePlaceholder_Broke              [UIImage imageNamed:@"个人头像占位图"]

/*---------系统版本--------------*/
#define IOS11Later  ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

#pragma mark -  第三方配置信息
/*--------------------------------------极光推送--------------------------------------*/
#define APP_KEY                 @"bf497542345a0803234e5a90"
#define CHANNEL                 @"App Store"
#define environment_status      1

#endif /* DefineKey_h */
