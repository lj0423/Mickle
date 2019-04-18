//
//  LJCancelRunloop.m
//  Mickle
//
//  Created by 刘瑾 on 2019/4/18.
//  Copyright © 2019年 LJA. All rights reserved.
//

#import "LJCancelRunloop.h"

@implementation LJCancelRunloop{
    
    NSMachPort *_aPort; //global
    NSRunLoop *_theRL;
    NSThread *_thread;
}

- (void)beginTest{
    // 开启一个新线程
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunLoopInNewThread) object:nil];
    [_thread setName:@"com.lja.thread"];
    [_thread start];
}

- (void)createRunLoopInNewThread {
    _theRL = [NSRunLoop currentRunLoop];
    _aPort = (NSMachPort *)[NSMachPort port];
    // 给runloop添加一个端口作为输入源，保证可以随时处理消息
    [_theRL addPort:_aPort forMode:NSDefaultRunLoopMode];
    
    // 该方法会在当前线程的runloop中创建一个timer，并在当前线程中执行selector
    [self performSelector:@selector(excuteInNewThread:) withObject:@"param1" afterDelay:5];
    [self performSelector:@selector(excuteInNewThread:) withObject:@"param2" afterDelay:6];
    
    [_theRL run];
    
    // 如果当前线程的runloop没有退出，则`[_theRL run]`之后的代码不会执行.
    NSLog(@"runloop已退出"); //只有当runloop退出，这里才会执行。可以通过注册runloop观察者进行验证，这里就不贴代码了，具体代码请到demo里查看。
}

- (void)excuteInNewThread:(NSString *)param {
    NSLog(@"%@", param);
    // 将当前线程的runloop中的port移除，苹果官方不推荐使用这种方式，因为有可能这个源移除之后，还有其他源导致不能完全保证能退出常驻线程
    [_theRL removePort:_aPort forMode:NSDefaultRunLoopMode];
}

@end
