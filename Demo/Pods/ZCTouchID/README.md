# ZCTouchID
####一行代码在你的App中加入TouchID指纹验证

> 如果有想要深入了解TouchID方面的内容，可以去看我的一篇博客
> 
> [LocalAuthentication源码学习](http://zcill.com/2016/02/29/LocalAuthentication源码学习/)

## - Usage
#### 导入`ZCTouchID.h`

```objective-c
	#import "ZCTouchID.h"
```
#### 先判断设备是否支持TouchID指纹识别

```objective-c
	if ([ZCTouchID sharedInstance].canEvaluatePolicy) {
		// 支持指纹识别
    } else {
    	// 不支持指纹识别
    }
```
#### 一行代码加入TouchID验证

```objective-c
        [[ZCTouchID sharedInstance] evaluatePolicyWithLocalizedReason:@"通过Home键验证已有手机指纹" fallbackButtonTitle:@"输入密码" completion:^(ZCTouchIDEvaluateResult result) {
            
        }];
```

## - ScreenShot
效果图

![效果图](http://7xr0k3.com1.z0.glb.clouddn.com/ZCTouchID/screenshot.gif)

导入

![import](http://7xr0k3.com1.z0.glb.clouddn.com/ZCTouchID/import.png)

使用

![use](http://7xr0k3.com1.z0.glb.clouddn.com/ZCTouchID/use.png)

