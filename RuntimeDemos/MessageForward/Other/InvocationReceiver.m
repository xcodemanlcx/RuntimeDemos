//
//  InvocationReceiver.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "InvocationReceiver.h"

@implementation InvocationReceiver

-(void)instanceFunction{
    NSLog(@"3 instance完整转发");
}

+(void)classFunction{
    NSLog(@"3 class完整转发");
}
@end
