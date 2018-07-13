//
//  ThreadSuXingVC.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//

#import "ThreadSuXingVC.h"

@interface ThreadSuXingVC ()

@end

@implementation ThreadSuXingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"NSTread属性"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self threadDemo];
}

- (void)threadDemo{
    NSThread *t = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    //在大型的商业项目中，通常希望程序在崩溃的时候，能够获取到程序准确的所在线程！
    t.name = @"Thread A";
    //优先级 从0.0 -----1.0  默认值0.5。 他保证CPU调度的可能会高，但是顺序无法控制！不理性的行为
    t.threadPriority = 0.1;
    [t start];
    
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    //在大型的商业项目中，通常希望程序在崩溃的时候，能够获取到程序准确的所在线程！
    t1.name = @"Thread B";
    t1.threadPriority = 1.0;
    [t1 start];
}

- (void)demo{
    for (int i = 0; i < 20; i++) {
        NSLog(@"%@  %d", [NSThread currentThread], i);
    }
}

/**
 多线程目的：将耗时操作放在后台，不阻塞UI线程！
 建议：在开发的时候，不要修改优先级
 在多线程开发中，不要相信一次的运行结果！！
 */



@end
