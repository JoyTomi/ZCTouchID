//
//  ZCTouchID.h
//  testLocalAuthentication
//
//  Created by 朱立焜 on 16/3/1.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZCTouchIDEvaluateResult) {
    ZCTouchIDEvaluateResultSuccess = 0, // 验证成功
    ZCTouchIDEvaluateResultFailed,      // 验证失败
    ZCTouchIDEvaluateResultCacel,       // 用户点击取消按钮
    ZCTouchIDEvaluateResultFallback,    // 用户点击输入密码按钮
    ZCTouchIDEvaluateResultOther        // 其他原因
};

typedef void(^ZCTouchIDEvaluateCompletion)(ZCTouchIDEvaluateResult result);

@interface ZCTouchID : NSObject

+ (instancetype)sharedInstance;

/**
 *  硬件是否支持指纹识别
 *
 *  @return 是否支持
 */
- (BOOL)canEvaluatePolicy;

/**
 *  验证指纹
 *
 *  @param reason     指纹验证框的描述
 *  @param title      指纹验证失败后，输入密码按钮的标题
 *  @param completion 完成回调
 */
- (void)evaluatePolicyWithLocalizedReason:(NSString *)reason
                      fallbackButtonTitle:(NSString *)title
                               completion:(ZCTouchIDEvaluateCompletion)completion;

@end
