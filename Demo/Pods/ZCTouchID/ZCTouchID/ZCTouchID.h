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

- (BOOL)canEvaluatePolicy;

- (void)evaluatePolicyWithLocalizedReason:(NSString *)reason
                      fallbackButtonTitle:(NSString *)title
                               completion:(ZCTouchIDEvaluateCompletion)completion;

@end
