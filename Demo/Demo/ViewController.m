//
//  ViewController.m
//  Demo
//
//  Created by Locke on 16/8/16.
//  Copyright © 2016年 Meitu. All rights reserved.
//

#import "ViewController.h"

#import <ZCTouchID/ZCTouchID.h>

@implementation ViewController

- (IBAction)onClicked:(UIButton *)sender {
    
    // 如果硬件支持指纹识别
    if ([ZCTouchID sharedInstance].canEvaluatePolicy) {
        
        [[ZCTouchID sharedInstance] evaluatePolicyWithLocalizedReason:@"Authenticate" fallbackButtonTitle:@"Test ZCTouchID Demo" completion:^(ZCTouchIDEvaluateResult result) {
            
            if (result == ZCTouchIDEvaluateResultSuccess) {
                NSLog(@"Success");
            }
            
        }];
        
    }
}

@end
