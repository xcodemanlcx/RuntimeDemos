//
//  NSObject+RTMethodSwizzling.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/10.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (RTMethodSwizzling)

//实例方法
+ (void)swizzleInstanceMethod:(Class)cls originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(cls, otherSelector);
    Method originMehtod = class_getInstanceMethod(cls, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

//类方法
+ (void)swizzleClassMethod:(Class)cls originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(cls, otherSelector);
    Method originMehtod = class_getClassMethod(cls, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

@end


@implementation UIViewController (RTMethodSwizzling)

+ (void)load
{
                [[self class]  swizzleInstanceMethod:NSClassFromString(@"UIViewController") originSelector:@selector(viewWillAppear:) otherSelector:@selector(test_viewWillAppear)];
}

-(void)test_viewWillAppear
{
    //test_viewWillAppear是交换过后的
    [self test_viewWillAppear];
    if ([NSStringFromClass([self class]) isEqualToString:@"RTMethodSwizzlingVC"]) {
        self.view.backgroundColor = [UIColor blueColor];
    }
}

@end

