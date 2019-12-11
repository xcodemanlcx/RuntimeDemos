//
//  RuntimeModel.h
//  RuntimeDemo
//
//  Created by leichunxiang on 15/11/19.
//  Copyright © 2015年 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeModel : NSObject<NSCopying>

@property (nonatomic,copy) NSString *publicName;
@property (nonatomic,assign) int age;

+ (void)classMethod;

@end
