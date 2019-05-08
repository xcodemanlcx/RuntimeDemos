//
//  RuntimeModel.h
//  RuntimeDemo
//
//  Created by leichunxiang on 15/11/19.
//  Copyright © 2015年 雷纯祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeModel : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *sex;

@property (nonatomic,assign) int age;

@property (nonatomic,copy) NSArray *books;

@property (nonatomic,assign) BOOL isMan;

- (void)publicMethod;
+ (void)classMethod;


@end
