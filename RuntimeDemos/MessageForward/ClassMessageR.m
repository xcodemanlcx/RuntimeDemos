//
//  ClassMessageR.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/13.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ClassMessageR.h"
#import "RuntimeTool.h"
#import "SpareReceiver.h"
#import "InvocationReceiver.h"
#import "StatusManager.h"

@interface ClassMessageR ()

@end

@implementation ClassMessageR

#pragma mark - 1 动态方法解析
+(BOOL)resolveClassMethod:(SEL)sel{
        if ([StatusManager shareInstance].status == 1&& sel == NSSelectorFromString(kClassFun)) {
             //获取元类
            [RuntimeTool addMethodForClass:[RuntimeTool getMetaClassWithClass:self]
                                       sel:sel
                                    impSel:NSSelectorFromString(@"dynamicAddClassMethod")];
            return YES;
        }
    return [super resolveClassMethod:sel];
}

#pragma mark - 2 备用接收者

+(id)forwardingTargetForSelector:(SEL)sel{
    if ([StatusManager shareInstance].status == 2 && sel == NSSelectorFromString(kClassFun)) {
        return [SpareReceiver class];
    }
    return [super forwardingTargetForSelector:sel];
}

#pragma mark - 3 完整转发

+(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if ([StatusManager shareInstance].status == 3 && sel == NSSelectorFromString(kClassFun)) {
        NSMethodSignature * sign = [InvocationReceiver methodSignatureForSelector:sel];
        return sign;
    }
    return [super methodSignatureForSelector:sel];
}

+(void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = anInvocation.selector;
    
    //备用类是否响应sel
    if ([InvocationReceiver respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:[InvocationReceiver class]];
    }else{
        [self doesNotRecognizeSelector:sel];
    }
}

#pragma mark - runtime动态添加的方法
+(void)dynamicAddClassMethod{
    NSLog(@"1 class动态方法解析，runtime动态添加方法");
}
@end
