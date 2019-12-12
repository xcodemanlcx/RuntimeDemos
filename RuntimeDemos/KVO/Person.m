//
//  Person.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/12.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person ()

@property (nonatomic ,copy) NSString *privateName;

@end

@implementation Person

- (NSString *)description {
    NSLog(@"object address : %p \n", self);
    
    //1 方法的具体实现
    IMP nameIMP = class_getMethodImplementation(object_getClass(self), @selector(setName:));
    IMP ageIMP = class_getMethodImplementation(object_getClass(self), @selector(setAge:));
    NSLog(@"object setName: IMP %p object setAge: IMP %p \n", nameIMP, ageIMP);
    
    //2 类、运行时类、父类
    Class objectMethodClass = [self class];
    Class objectRuntimeClass = object_getClass(self);
    Class superClass = class_getSuperclass(objectRuntimeClass);
    NSLog(@"objectMethodClass : %@, ObjectRuntimeClass : %@, superClass : %@ \n", objectMethodClass, objectRuntimeClass, superClass);
    
    //3 方法列表
    NSString *printString = @"\n------methodList------";
    unsigned int count;
    Method *methodList = class_copyMethodList(objectRuntimeClass, &count);
    for (NSInteger i = 0; i < count; i++) {
        NSString *methodName =  NSStringFromSelector(method_getName(methodList[i]));
        printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\n method name = %@",methodName]];
    }
    NSLog(@"%@,", printString);

    return @"";
}

- (void)directChangeAge:(int)age;
{
    _age =  age;
    NSLog(@"directChangeAge:_age = %d",age);
}

/** 手动KVO
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}
- (void)setName:(NSString *)name{
    [self willChangeValueForKey:@"name"];
    _name= name;
    [self didChangeValueForKey:@"name"];
}
*/

@end
