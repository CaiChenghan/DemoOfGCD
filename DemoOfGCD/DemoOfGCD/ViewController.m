//
//  ViewController.m
//  DemoOfGCD
//
//  Created by 蔡成汉 on 2016/12/27.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"
#import "EightViewController.h"
#import "NightViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.tableFooterView = [UIView new];
    [self.view addSubview:myTableView];
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"GCD用法%ld",(indexPath.row+1)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        FirstViewController *controller = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        SecondViewController *controller = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2){
        ThirdViewController *controller = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 3){
        FourViewController *controller = [[FourViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 4){
        FiveViewController *controller = [[FiveViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 5){
        SixViewController *controller = [[SixViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 6){
        SevenViewController *controller = [[SevenViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 7){
        EightViewController *controller = [[EightViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 8){
        NightViewController *controller = [[NightViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
