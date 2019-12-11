//
//  StatusManager.h
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic ) int status;

@end

NS_ASSUME_NONNULL_END
