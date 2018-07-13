//
//  Demo.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//

#import "Demo.h"

@interface Demo ()

/** 票数*/
@property (nonatomic, assign) int tickets;

@end

@implementation Demo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"资源共享"];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.tickets = 20;
//    [self saleTickes];
    
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickes) object:nil];
    t1.name = @"售票员A";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickes) object:nil];
    t2.name = @"售票员B";
    [t2 start];
    
}

- (void)saleTickes{
    while (YES) {
        [NSThread sleepForTimeInterval:1.0];
        //互斥锁 -- 保证锁内的代码，同一时间内，保证只有一条线程执行
        //---------范围应该尽量的小，范围大效率就差！
        //一般使用self
        //参数：任意OC对象都OK(局部变量是每个线程单独拥有的，那么就无法加锁！！！)
        @synchronized(self){
            if (self.tickets > 0) {
                self.tickets--;
                NSLog(@"%@   %d", [NSThread currentThread], self.tickets);
            }else{
                NSLog(@"卖完了 %@", [NSThread currentThread]);
                break;
            }
        }
        
        
    }
}

@end
