//
//  Define_API.h
//  GeneralProject
//
//  Created by Michael on 2018/2/24.
//  Copyright © 2018年 wolfpack. All rights reserved.
//

#ifndef Define_API_h
#define Define_API_h

//本地环境
#define HOST_URL @"http://10.15.208.179:8090/jk_community/uc/"
//测试环境
//#define HOST_URL @"https://api-development.tq-service.com/v2/tqapp/jk_community/uc/"
//正式环境
//#define HOST_URL @"https://api.tq-service.com/v2/tqapp/jk_community/uc/"

#define Interface_Combine(url) [NSString stringWithFormat:@"%@%@", HOST_URL, url]

//获取验证码
#define API_GET_VERTIFYCODE Interface_Combine(@"public/sendCaptcha")



#endif /* Define_API_h */
