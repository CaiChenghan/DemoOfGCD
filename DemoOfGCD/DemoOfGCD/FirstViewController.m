//
//  FirstViewController.m
//  DemoOfGCD
//
//  Created by 蔡成汉 on 2016/12/27.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  获取主线程串行队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    //  添加“异步”任务
    dispatch_async(mainQueue, ^{
        sleep(1);
        NSLog(@"异步任务1%@",[NSThread currentThread]);
    });
    
    dispatch_async(mainQueue, ^{
        sleep(1);
        NSLog(@"异步任务2%@",[NSThread currentThread]);
    });
    
    dispatch_async(mainQueue, ^{
        sleep(1);
        NSLog(@"异步任务3%@",[NSThread currentThread]);
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
