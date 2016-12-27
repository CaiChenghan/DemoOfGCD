//
//  SevenViewController.m
//  DemoOfGCD
//
//  Created by 蔡成汉 on 2016/12/27.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "SevenViewController.h"

@interface SevenViewController ()

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  自定义并行队列
    dispatch_queue_t queue = dispatch_queue_create("com.caichenghan.demoOfGCD", DISPATCH_QUEUE_CONCURRENT);
    
    //  队列类型型 串行：DISPATCH_QUEUE_SERIAL；并行：DISPATCH_QUEUE_CONCURRENT
    
    //  添加异步任务
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"异步任务1%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"异步任务2%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
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
