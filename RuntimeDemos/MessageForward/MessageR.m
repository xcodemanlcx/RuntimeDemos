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
#import <objc/runtime.h>


@interface MessageR ()

@end

@implementation MessageR

#pragma mark - 1 动态方法解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == NSSelectorFromString(instanceFun)) {
//        [RuntimeTool addMethodForClass:self
//                                   sel:sel
//                                impSel:NSSelectorFromString(@"addDynamicMethod")];
//        return NO;
//    }
    return [super resolveInstanceMethod:sel];
}
#pragma mark - 2 备用接收者

-(id)forwardingTargetForSelector:(SEL)sel{
//    if (sel == NSSelectorFromString(instanceFun)) {
//        SpareReceiver *s = [[SpareReceiver alloc] init];
//        return s;
//    }
    return [super forwardingTargetForSelector:sel];
}

#pragma mark - 3 完整转发

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if (sel == NSSelectorFromString(instanceFun)) {
        
        /**
         1.手动创建签名 但是尽量少使用 因为容易创建错误 可以按照这个规则来创建
         https://blog.csdn.net/ssirreplaceable/article/details/53376915
         根据OBJC的编码类别进行编写后面的char （但是容易写错误，所以建议使用下面的方法）
         NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
         //写法例子
         //例子"v@:@"
         //v@:@ v:返回值类型void;@ id类型,执行sel的对象;：SEL;@参数
         //例子"@@:"
         //@:返回值类型id;@id类型,执行sel的对象;：SEL
         2.自动创建签名
         BackupTestMessage * backUp = [BackupTestMessage new];
         NSMethodSignature * sign = [backUp methodSignatureForSelector:aSelector];
         使用对象本身的methodSignatureForSelector自动获取该SEL对应类别的签名
         */
        
        NSMethodSignature * sign = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sign;
    }
    return [super methodSignatureForSelector:sel];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    //创建备用对象
    SpareReceiver * spareReceiver = [[SpareReceiver alloc] init];
    SEL sel = anInvocation.selector;
    
    //是否响应sel
    if ([spareReceiver respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:spareReceiver];
    }else{
        [self doesNotRecognizeSelector:sel];
    }
}

#pragma mark - runtime动态添加的方法

-(void)addDynamicMethod{
    NSLog(@"动态添加,对象方法");
}

+(void)addClassDynamicMethod{
    NSLog(@"动态添加，类方法");
}

@end
