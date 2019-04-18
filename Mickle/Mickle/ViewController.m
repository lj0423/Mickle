//
//  ViewController.m
//  Mickle
//
//  Created by 刘瑾 on 2019/4/18.
//  Copyright © 2019年 LJA. All rights reserved.
//

#import "ViewController.h"
#import "MultiThread/Runloop/LJCancelRunloop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LJCancelRunloop *cancelInstance = [[LJCancelRunloop alloc] init];
    [cancelInstance beginTest];
    
}


@end
