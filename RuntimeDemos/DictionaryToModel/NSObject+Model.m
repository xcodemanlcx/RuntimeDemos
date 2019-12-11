//
//  NSObject+Model.m
//  RuntimeDemos
//
//  Created by leichunxiang on 2019/4/17.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)

+ (instancetype)modelWithDic:(NSDictionary *)dic{
    id model = [[self alloc] init];
    // 遍历模型中成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0 ; i < count; i++) {
        Ivar ivar = ivars[i];
        //获取属性字符串key
        NSString *ivarKey = [NSString stringWithUTF8String:ivar_getName(ivar)];
        ivarKey = [ivarKey substringFromIndex:1];
        id value = dic[ivarKey];
        if (value) {
            //赋值
            [model setValue:value forKeyPath:ivarKey];
        }
    }
    return model;
}

@end
