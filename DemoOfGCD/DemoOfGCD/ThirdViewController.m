//
//  ThirdViewController.m
//  DemoOfGCD
//
//  Created by 蔡成汉 on 2016/12/27.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  获取全局并发队列,并且设置优先级为默认优先级
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //  全局并发队列优先级
    //  DISPATCH_QUEUE_PRIORITY_HIGH 2
    //  DISPATCH_QUEUE_PRIORITY_DEFAULT 0
    //  DISPATCH_QUEUE_PRIORITY_LOW (-2)
    //  DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
    
    //  添加异步任务
    dispatch_async(globalQueue, ^{
        sleep(1);
        NSLog(@"异步任务1%@",[NSThread currentThread]);
    });
    
    dispatch_async(globalQueue, ^{
        sleep(1);
        NSLog(@"异步任务2%@",[NSThread currentThread]);
    });
    
    dispatch_async(globalQueue, ^{
        sleep(1);
        NSLog(@"异步任务3%@",[NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"执行完毕，回到主线程%@",[NSThread currentThread]);
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
