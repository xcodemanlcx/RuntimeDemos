//
//  RuntimeModel+Property.m
//  RuntimeDemos
//
//  Created by leichunxiang on 2019/4/19.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RuntimeModel+Property.h"
#import <objc/runtime.h>

@implementation RuntimeModel (Property)

- (void)setCategoryName:(NSString *)categoryName{
    objc_setAssociatedObject(self, @selector(categoryName), categoryName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)categoryName{
    return objc_getAssociatedObject(self, @selector(categoryName));
}
@end
