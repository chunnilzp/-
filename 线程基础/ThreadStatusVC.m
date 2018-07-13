//
//  GCDVC.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//

/*
 GCD： 旨在替换NSThread等线程计数   充分利用是被多核   C语言  自动管理  经常使用
        他不是多线程    中枢调度系统   并发
 */

#import "ThreadStatusVC.h"

@interface ThreadStatusVC ()

@end

@implementation ThreadStatusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"线程状态"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //注意！！！exit会杀掉主线程！但是APP不会挂掉
//    [NSThread exit];
    [self threadDemo];
}

- (void)threadDemo{
    //创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadStatus) object:nil];
    
    //线程就绪（可被CPU调度）
    [thread start];
}

- (void)threadStatus{
    //阻塞,当运行满足某个条件，会让线程‘睡一会’
    for (int i = 0; i < 20; i++) {
        //sleep是类方法，会直接休眠当前线程
        if (i == 8) {
            NSLog(@"睡一会");
            [NSThread sleepForTimeInterval:2.0];
        }
        NSLog(@"%@  %d", [NSThread currentThread], i);
        
        //当线程满足某一个条件时，可以强行终止
        //exit类方法，终止当前线程
        //一旦强行终止线程，后续代码都不会被执行。在行为上跟return相似，但是意义不同。
        //注意，在我们终止线程之前，应该要释放之前分配的对象！！！！(ARC不会管理C语言)
        if (i == 15) {
            [NSThread exit];
        }
    }
    NSLog(@"来不了");
}

@end
