//
//  RuntimeTool.h
//  MessageForward
//
//  Created by leichunxiang on 2019/4/5.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeTool : NSObject

//获取元类
+(Class)getMetaClassWithClass:(Class)class;

//添加类方法
+(void)addMethodForClass:(Class)class sel:(SEL)sel impSel:(SEL)impSel;

@end

NS_ASSUME_NONNULL_END
