//
//  TestModel.h
//  RuntimeDemos
//
//  Created by leichunxiang on 2019/4/17.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isMan;
@property (nonatomic, assign) int score;

@end

NS_ASSUME_NONNULL_END
