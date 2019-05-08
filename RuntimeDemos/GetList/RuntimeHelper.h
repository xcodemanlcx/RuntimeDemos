//
//  RuntimeHelper.h
//  RuntimeDemo
//
//  Created by leichunxiang on 15/11/19.
//  Copyright © 2015年 雷纯祥. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct objc_ivar *Ivar;

@interface RuntimeHelper : NSObject

#pragma - 获取:变量、属性、实例对象方法

//变量列表
+ (Ivar *)printClassIvars:(Class)aClass;

//属性列表
+ (void)printClassProperties:(Class)aClass;

//实例对象方法列表（无类方法）
+ (void)printInstanceMethods:(Class)aClass;

@end
