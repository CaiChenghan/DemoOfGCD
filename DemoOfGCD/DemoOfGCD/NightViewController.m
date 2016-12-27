//
//  NightViewController.m
//  DemoOfGCD
//
//  Created by 蔡成汉 on 2016/12/27.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NightViewController.h"

@interface NightViewController ()

@end

@implementation NightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  获取全局并发队列
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //  创建线程组
    dispatch_group_t groupQueue = dispatch_group_create();
    
    //  添加异步任务
    dispatch_group_async(groupQueue, globalQueue, ^{
        NSLog(@"线程组异步任务1%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(groupQueue, globalQueue, ^{
        NSLog(@"线程组异步任务2%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(groupQueue, globalQueue, ^{
        NSLog(@"线程组异步任务3%@",[NSThread currentThread]);
    });
    
    //  线程组任务完成回调
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        NSLog(@"线程组任务执行完毕%@",[NSThread currentThread]);
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
