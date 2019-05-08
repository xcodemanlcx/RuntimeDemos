//
//  NSObject+MethodSwizzling.m
//  RuntimeDemos
//
//  Created by leichunxiang on 2019/4/19.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RuntimeModel.h"
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzling)

//类方法
+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(class, otherSelector);
    Method originMehtod = class_getClassMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

//实例方法
+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

@end

#pragma mark - 交换例子1：已实现的 个方法交换

@implementation RuntimeModel(MethodSwizzling)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"RuntimeModel") originSelector:@selector(setName:) otherSelector:@selector(setSex:)];
}

@end


#pragma mark - 例子2：自定义方法与系统方法交换

//UIViewController: 方法test_viewWillAppear，替换方法viewWillAppear:
//验证现象：UIViewController显示时，打印“test_viewWillAppear”；

 //交换方法
 @implementation  UIViewController(MethodSwizzling)
 
 + (void)load
 {
 
 [self  swizzleInstanceMethod:NSClassFromString(@"UIViewController") originSelector:@selector(viewWillAppear:) otherSelector:@selector(test_viewWillAppear)];
 }
 
 -(void)test_viewWillAppear
 {
     //test_viewWillAppear是交换过后的
     [self test_viewWillAppear];
     self.view.backgroundColor = [UIColor blueColor];
 }
 
 @end
