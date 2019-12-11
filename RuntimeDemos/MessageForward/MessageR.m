//
//  MessageR.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "MessageR.h"
#import "RuntimeTool.h"
#import "SpareReceiver.h"
#import "InvocationReceiver.h"
#import "StatusManager.h"

@interface MessageR ()


@end

@implementation MessageR
{
    InvocationReceiver *_invocationReceiver;
}
#pragma mark - 1 动态方法解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if ([StatusManager shareInstance].status == 1) {
            if (sel == NSSelectorFromString(kInstanceFun)) {
            [RuntimeTool addMethodForClass:self
                                       sel:sel
                                    impSel:NSSelectorFromString(@"dynamicAddMethod")];
            return YES;
        }
    }
    return [super resolveInstanceMethod:sel];
}
#pragma mark - 2 备用接收者

-(id)forwardingTargetForSelector:(SEL)sel{
    if ([StatusManager shareInstance].status == 2) {
        if (sel == NSSelectorFromString(kInstanceFun)) {
            SpareReceiver *spareReceiver = [[SpareReceiver alloc] init];
            return spareReceiver;
        }
    }
    return [super forwardingTargetForSelector:sel];
}

#pragma mark - 3 完整转发

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if ([StatusManager shareInstance].status == 3 && sel == NSSelectorFromString(kInstanceFun)) {
        //1 自动签名
        _invocationReceiver = [InvocationReceiver new];
         NSMethodSignature * sign = [_invocationReceiver  methodSignatureForSelector:sel];

        /** 2 手动签名参考:https://blog.csdn.net/ssirreplaceable/article/details/53376915;
         v@:解释：v表示返回值为void；@表示id类型，执行SEL的对象；:表示SEL；
         */
//        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sign;
    }
    return [super methodSignatureForSelector:sel];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    //完整转发
    SEL sel = anInvocation.selector;
    //是否响应sel
    if ([StatusManager shareInstance].status == 3) {
        if ([_invocationReceiver respondsToSelector:sel]) {
            [anInvocation invokeWithTarget:_invocationReceiver];
            return;
        }
    }

    [self doesNotRecognizeSelector:sel];
}

#pragma mark - runtime动态添加的方法

-(void)dynamicAddMethod{
    NSLog(@"1 instance动态方法解析，runtime动态添加方法");
}

#pragma mark -  二 类方法的消息转发说明

/**类方法消息转发：
 
1、动态方法解析使用：+ (BOOL)resolveClassMethod:(SEL)sel；
2、备用接受者、完整转发使用：实例消息转发的相关实例方法，由-方法变成+方法；
*/
@end
