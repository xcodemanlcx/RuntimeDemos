//
//  RTQueryh
//  RuntimeDemos
//
//  Created by lcx on 2019/12/10.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (RTCopyList)

//属性列表
+(void)propertyListBlock:(void(^)( objc_property_t *propertyList, unsigned int count))propertyListBlock;

//成员变量列表
+(void)ivarListBlock:(void(^)(Ivar *ivarList, unsigned int count))ivarListBlock;

//方法列表
+(void)methodListBlock:(void(^)(Method *methodList, unsigned int count))methodListBlock;

//协议列表
+(void)protocolListBlock:(void(^)(__unsafe_unretained Protocol **protocolList, unsigned int count))protocolListBlock;

@end

@interface RTProperty : NSObject

- (instancetype)initWithProperty:(objc_property_t)property;

@property (nonatomic ,assign ,readonly) objc_property_t property;
@property (nonatomic ,copy ,readonly) NSString *name;

@end

@interface RTIvar : NSObject

- (instancetype)initWithIvar:(Ivar)ivar;

@property (nonatomic ,assign ,readonly) Ivar ivar;
@property (nonatomic ,copy ,readonly) NSString *name;
@property (nonatomic ,copy ,readonly) NSString *type;

@end

@interface RTMethod : NSObject

- (instancetype)initWithMethod:(Method )method;

@property (nonatomic ,assign ,readonly) Method method;
@property (nonatomic ,copy, readonly) NSString *name;
@property (nonatomic ,copy, readonly) NSString *type;
@property (nonatomic, assign, readonly) SEL sel;
@property (nonatomic, assign, readonly) IMP imp;

@end

@interface RTProtocol : NSObject

- (instancetype)initWithProtocol:(Protocol *)protocol;

@property (nonatomic ,assign ,readonly) Protocol *protocol;
@property (nonatomic ,copy, readonly) NSString *name;

@end
