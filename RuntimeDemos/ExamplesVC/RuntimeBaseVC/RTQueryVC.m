//
//  RTQueryVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/10.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RTQueryVC.h"
#import "RuntimeModel.h"
#import "RTQuery.h"

@interface RTQueryVC ()

@end

@implementation RTQueryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [RuntimeModel propertyListBlock:^(objc_property_t *propertyList, unsigned int count) {
        NSString *printString = @"------runtime Query property------";
        for (int i = 0; i < count; i++) {
            objc_property_t property = propertyList[i];
            RTProperty *propertyObj = [[RTProperty alloc] initWithProperty:property];
            printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\n property name = %@",propertyObj.name]];
        }
        NSLog(@"%@",printString);
    }];
    
    [RuntimeModel ivarListBlock:^(Ivar *ivarList, unsigned int count) {
        NSString *printString = @"------runtime Query ivar------";
        for (int i = 0; i < count; i++) {
            RTIvar *ivarObj = [[RTIvar alloc] initWithIvar:ivarList[i]];
            printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\n ivar: name = %@, type = %@",ivarObj.name,ivarObj.type]];
        }
        NSLog(@"%@",printString);
    }];
    
    [RuntimeModel methodListBlock:^(Method *methodList, unsigned int count) {
        NSString *printString = @"------runtime Query method-------";
        for (int i = 0; i < count; i++) {
            RTMethod *methodObj = [[RTMethod alloc] initWithMethod:methodList[i]];
            printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\n method: name = %@, type = %@",methodObj.name,methodObj.type]];
        }
        NSLog(@"%@",printString);
    }];
    
    //类方法查询
    [[RuntimeModel superclass] methodListBlock:^(Method *methodList, unsigned int count) {
        NSString *printString = @"------runtime Query   superclass method-------";
        for (int i = 0; i < count; i++) {
            RTMethod *methodObj = [[RTMethod alloc] initWithMethod:methodList[i]];
            printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\nsuperclass method: name = %@, type = %@",methodObj.name,methodObj.type]];
        }
        NSLog(@"%@",printString);
    }];
    
    [RuntimeModel protocolListBlock:^(Protocol *__unsafe_unretained *protocolList, unsigned int count) {
                NSString *printString = @"------runtime Query protocol-------";
        for (int i = 0; i < count; i++) {
            RTProtocol *protocolObj = [[RTProtocol alloc] initWithProtocol:protocolList[i]];
            printString = [printString stringByAppendingString:[NSString stringWithFormat:@"\n protocol: name = %@",protocolObj.name]];
        }
        NSLog(@"%@",printString);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
