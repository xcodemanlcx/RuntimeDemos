//
//  Person.h
//  RuntimeDemos
//
//  Created by lcx on 2019/12/12.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,assign) int age;

- (void)directChangeAge:(int)age;

@end

NS_ASSUME_NONNULL_END
