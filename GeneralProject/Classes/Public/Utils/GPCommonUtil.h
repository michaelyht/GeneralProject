//
//  GPCommonUtil.h
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPCommonUtil : NSObject

+ (void)setRootViewWithLogin;

+ (void)setRootViewWithMain;

/**
 弹框提示重新登录
 */
+(void)reLogin;

@end
