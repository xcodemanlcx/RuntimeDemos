//
//  RTQuerym
//  RuntimeDemos
//
//  Created by lcx on 2019/12/10.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RTQuery.h"

@implementation NSObject (RTCopyList)

+(void)propertyListBlock:(void(^)(objc_property_t *, unsigned int count))propertyListBlock{
    if (propertyListBlock) {
        unsigned int count;
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        propertyListBlock(propertyList,count);
        free(propertyList);
    }
}

+(void)ivarListBlock:(void(^)(Ivar *ivarList, unsigned int count))ivarListBlock{
    if (ivarListBlock) {
        unsigned int count;
        Ivar *ivarList = class_copyIvarList([self class], &count);
        ivarListBlock(ivarList,count);
        free(ivarList);
    }
}

+(void)methodListBlock:(void(^)(Method *methodList, unsigned int count))methodListBlock{
    if (methodListBlock) {
        unsigned int count;
        Method *methodList = class_copyMethodList([self class], &count);
        methodListBlock(methodList,count);
        free(methodList);
    }
}

+(void)protocolListBlock:(void(^)(__unsafe_unretained Protocol **protocolList, unsigned int count))protocolListBlock{
    if (protocolListBlock) {
        unsigned int count;
        __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
        protocolListBlock(protocolList,count);
        free(protocolList);
    }
}

@end

@implementation RTProperty

- (instancetype)initWithProperty:(objc_property_t)property
{
    self = [super init];
    if (self) {
        _property = property;
        _name = [NSString stringWithUTF8String:property_getName(property)];
    }
    return self;
}

@end

@implementation RTIvar

- (instancetype)initWithIvar:(Ivar)ivar
{
    self = [super init];
    if (self) {
        _ivar = ivar;
        _name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        _type =  [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
    }
    return self;
}

@end

@implementation RTMethod

- (instancetype)initWithMethod:(Method )method
{
    self = [super init];
    if (self) {
        _method = method;
        _name = NSStringFromSelector(method_getName(method));
        _type =[NSString stringWithUTF8String:method_getTypeEncoding(method)];
        _sel = method_getName(method);
        _imp = method_getImplementation(method);
    }
    return self;
}

@end

@implementation RTProtocol

- (instancetype)initWithProtocol:(Protocol *)protocol{
    self = [super init];
    if (self) {
        _protocol = protocol;
        _name = [NSString stringWithUTF8String:protocol_getName(protocol)];
    }
    return self;
}

@end
