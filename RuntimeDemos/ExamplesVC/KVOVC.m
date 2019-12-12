//
//  KVOVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/12.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "KVOVC.h"
#import "Person.h"

@interface KVOVC ()

@property (nonatomic, strong) Person *person1;
@property (nonatomic, strong) Person *person2;

@end

@implementation KVOVC

- (void)dealloc
{
    [_person1 removeObserver:self forKeyPath:@"name"];
    [_person1 removeObserver:self forKeyPath:@"age"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person1 = Person.new;
    self.person2 = Person.new;
    
    NSLog(@"\n------person1------");
    [self.person1 description];
    NSLog(@"\n------person2------");
    [self.person2 description];
    
    [self.person1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//    [self.person1 addObserver:self forKeyPath:@"privateName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.person1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    /**
     一、person1的属性增加观察者前后的变化：
     1、生成的中间类：NSKVONotifying_Person（object_getClass方法获取），且其父类是Person； 2、class方法获取的类还是原来的Person类：说明object_getClass才能获取运行时实际的类，且重写了；
     3、NSKVONotifying_Person多了_isKVOA方法； 4、断点kvo回调方法，回调的参数keyPath只有@"name",没有@"age"，且只回调了一次；
     
     二、对比分析：
     a、由1推断object_getClass才能获取运行时实际的类；
     b、由1、2推断，中间类NSKVONotifying_Person重写class方法，所以才能通过class方法获取原来的Person类；
     c、由3，_isKVOA可作为kvo的标记；
     d、由4推断，set方法会触发kvo，而直接访问实例变量不会，所以中间类重写了set方法；
     e、结合推断d与kvo回调可获取新旧值可知，KVO的实现是基于set方法和KVC的，官方文档也提示KVO实现与KVC有关系；
     
     三、补充与扩展：
     1、结合KVC，可以观察私有属性的变化；
     2、手动KVO:查看Person内部注释代码；
     
     四、使用注意：
     1、Observer的add与remove要成对出现：因为KVO不会对Observer强引用，所以要观察Observer的生命周期，add后要注意remove；但xcode 11.2.1测试不remove也不会crash了；
     2、forKeyPath：不能为nil、NULL；
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        self.person1.name = @"zhang san";
    //    [self.person1 setValue:@"zhang san privateName" forKey:@"privateName"];
        [self.person1 directChangeAge:18];
        
        NSLog(@"\n------person1------");
        [self.person1 description];
        NSLog(@"\n------person2------");
        [self.person2 description];}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"keyPath = %@",keyPath);
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
