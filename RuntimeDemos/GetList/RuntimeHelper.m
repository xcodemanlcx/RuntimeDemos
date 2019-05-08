//
//  RuntimeHelper.m
//  RuntimeDemo
//
//  Created by leichunxiang on 15/11/19.
//  Copyright © 2015年 雷纯祥. All rights reserved.
//

#import "RuntimeHelper.h"
#import <objc/runtime.h>

@implementation RuntimeHelper


+ (void)printClassProperties:(Class)aClass{
    NSMutableString *string = [NSMutableString stringWithFormat:@"class:%@",aClass];
    
    unsigned int outCount, i;
    //属性列表
    objc_property_t *properties = class_copyPropertyList(aClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [string appendFormat:@"\n%@",propertyName];
    }
    free(properties);
    
    NSLog(@"属性\n%@\n",string);
}

+ (Ivar *)printClassIvars:(Class)aClass
{
    NSLog(@"class :%@\n",aClass);

    NSMutableString *printString = [NSMutableString stringWithFormat:@"\n class:%@",aClass];
    unsigned int  outCount;
    //变量列表
    Ivar  *ivarList =  class_copyIvarList(aClass, &outCount);
    for (int i = 0; i<outCount; i++) {
        //变量名
        NSString * string = [NSString stringWithCString:ivar_getName(ivarList[i]) encoding:NSUTF8StringEncoding];
        //变量类型
        NSString * type = [NSString stringWithCString:ivar_getTypeEncoding(ivarList[i]) encoding:NSUTF8StringEncoding];
        [printString appendFormat:@"\n ivar = %@, ivalType = %@",string,type];
        NSLog(@"ivar=%@,type=%@\n",string,type);
    }

    return ivarList;
}

+ (void)printInstanceMethods:(Class)aClass
{
    NSMutableString *string = [NSMutableString stringWithFormat:@"class:%@",aClass];
    
    unsigned int  outCount;
    
    //方法列表
    Method  *methodList =  class_copyMethodList(aClass, &outCount);
    for (int i = 0; i<outCount; i++) {
        NSString *methodString = NSStringFromSelector(method_getName(methodList[i]));
        [string appendFormat:@"\n%@",methodString];
    }
    NSLog(@"方法\n%@\n",string);
}

@end
