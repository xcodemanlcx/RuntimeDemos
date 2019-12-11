//
//  RuntimeTool.m
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RuntimeTool.h"
#import <objc/runtime.h>


@implementation RuntimeTool

//获取元类
+(Class)getMetaClassWithClass:(Class)class{
    return objc_getMetaClass(class_getName(class));
}

//添加对象方法
+(void)addMethodForClass:(Class)class sel:(SEL)sel impSel:(SEL)impSel{
    Method method = class_getInstanceMethod(class, impSel);
    IMP methodIMP = method_getImplementation(method);
    const char * types = method_getTypeEncoding(method);
    class_addMethod(class, sel, methodIMP, types);
}
@end
