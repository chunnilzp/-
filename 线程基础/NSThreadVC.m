//
//  NSThreadVC.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//


/*
 NSThreadVC:  OC  使用面向对象   简单易用  直接操作线程对象
            程序员管理   偶尔使用
 
 创建线程对象，在内存中的可调度线程池中。线程池由CPU控制。
 */

#import "NSThreadVC.h"

@interface NSThreadVC ()

@end

@implementation NSThreadVC
 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"NSThreadVC"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self threadDemo3];
}

- (void)threadDemo1{
    
    NSLog(@"A-----------------");
    
    //创建一个NSthread
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo:) object:@"Thread"];
    //启动线程
    [thread start];
    
    
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"\n\n");
    }
    
    NSLog(@"B----------------");
}

- (void)threadDemo2{
    
    NSLog(@"A----------%@", [NSThread currentThread]);
    //detach ==> 分离 直接分离线程   不需要在start启动线程
    [NSThread detachNewThreadSelector:@selector(demo:) toTarget:self withObject:@"Thread"];
    
    NSLog(@"B----------%@", [NSThread currentThread]);
}

- (void)threadDemo3{
    //NSObject的分类方法，所有继承NSObject的都可以用，不需要调用NSThread方法
    //InBackground 在后台运行，也就是子线程。
    
    NSLog(@"A----------%@", [NSThread currentThread]);
    [self performSelectorInBackground:@selector(demo:) withObject:@"backGround"];
    NSLog(@"B----------%@", [NSThread currentThread]);
}

- (void)demo:(id)obj{
    for (int i = 0; i < 2; i++) {
        NSLog(@"C----------%@   %@", obj, [NSThread currentThread]);
    }
}


@end
