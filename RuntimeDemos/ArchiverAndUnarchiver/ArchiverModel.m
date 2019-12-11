//
//  ArchiverModel.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ArchiverModel.h"
#import <objc/runtime.h>

@implementation ArchiverModel

//原理：使用Runtime动态获取所有属性
//解档操作
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivarList[i];
            const char *ivarName = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:ivarName];
            id value = [aDecoder decodeObjectForKey:key];
            if (value) {
                [self setValue:value forKey:key];
            }
        }
        //释放指针
        free(ivarList);
    }
    return self;
}

//归档操作
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        if (value) {
            [aCoder encodeObject:value forKey:key];
        }
    }
    //释放指针
    free(ivarList);
}

@end
