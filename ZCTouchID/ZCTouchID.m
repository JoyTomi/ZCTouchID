//
//  ZCTouchID.m
//  testLocalAuthentication
//
//  Created by 朱立焜 on 16/3/1.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

#import "ZCTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation ZCTouchID

+ (instancetype)sharedInstance {
    static ZCTouchID *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZCTouchID alloc] init];
    });
    return instance;
}

- (BOOL)canEvaluatePolicy {
    
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    
    return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    
}

- (void)evaluatePolicyWithLocalizedReason:(NSString *)reason
                      fallbackButtonTitle:(NSString *)title
                               completion:(ZCTouchIDEvaluateCompletion)completion {
    
    LAContext *context = [[LAContext alloc] init];
    if (title) {
        context.localizedFallbackTitle = title;
    }
    
    NSString *localizedReason = reason;
    __weak typeof(self) weakSelf = self;
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:localizedReason reply:^(BOOL success, NSError * _Nullable error) {
        
        if (success) {
            [[weakSelf class] reportResultOnUI:ZCTouchIDEvaluateResultSuccess completion:completion];
        } else {
            switch (error.code) {
                case LAErrorAuthenticationFailed:
                    [[weakSelf class] reportResultOnUI:ZCTouchIDEvaluateResultFailed completion:completion];
                    break;
                case LAErrorUserCancel:
                    [[weakSelf class] reportResultOnUI:ZCTouchIDEvaluateResultCacel completion:completion];
                    break;
                case LAErrorUserFallback:
                    [[weakSelf class] reportResultOnUI:ZCTouchIDEvaluateResultFallback completion:completion];
                    break;
                default:
                    [[weakSelf class] reportResultOnUI:ZCTouchIDEvaluateResultOther completion:completion];
                    break;
            }
        }
        
    }];
    
}

+ (void)reportResultOnUI:(ZCTouchIDEvaluateResult)result completion:(ZCTouchIDEvaluateCompletion)completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(result);
    });
}

@end
