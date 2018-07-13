//
//  ViewController.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//

/*
 多线程开发中！！千万不要相信一次的执行结果
 pthread --- C语言  一套通用多线程的API  跨平台  可移植  难度大 （iOS基本不会用，但是可以了解）
 
 
 */

#import "PthreadVC.h"
#import <pthread.h>

@interface PthreadVC ()

@end

@implementation PthreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"pthread";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[NSThread currentThread] 1为主线程，其他为子线程
    [self pthreadDemo];
}

- (void)pthreadDemo{
    /*
     pthread 属于 POSIX 多线程开发框架
     参数：
     1.指向线程代号的指针
     2.线程的属性
     3.指向函数的指针
     4.传递该函数的参数
     
     return 如果是0表示正确，如果是非0表示错误代码
     
     void *   (*)           (void  *)
     返回值    （函数指针）    (参数)
     void* == id
     
     - 在ARC开发中， 如果涉及到和C语言中相同的数据类型进行转换，需要使用 __bridge “桥接” （转换成C语言，但是还是需要OC来进行内存管理，也就是引用计数）
     - 在MRC开发中， 就不需要__bridge
     
     
     */
    
    NSString *str = @"hello word";
    pthread_t threadId;
    int result = pthread_create(&threadId, NULL, &demo, (__bridge void*)str);
    if (result == 0) {
        NSLog(@"OK");
    }else{
        NSLog(@"errer:%d", result);
    }
}

void * demo(void * param){
    NSLog(@"%@", param);
    NSLog(@"%@", [NSThread currentThread]);
    return NULL;
}


@end
