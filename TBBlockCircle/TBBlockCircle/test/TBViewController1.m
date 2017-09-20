//
//  TBViewController1.m
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/12.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBViewController1.h"
#import "TBViewController2.h"
#import "TBBlockObject.h"

@interface TBViewController1 ()

@property (nonatomic, strong)TBBlockObject *tbBlockObject;
@property (nonatomic, strong)TBViewController1 *vc3;


@end

@implementation TBViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupButton1];
    
    [self setupButton2];
    
    [self objectsHaveSameBlock];
}

// 2个对象同时拥有同一block
- (void)objectsHaveSameBlock {
    
    TBBlockObject *tbBlockObject = [[TBBlockObject alloc] init];
    self.tbBlockObject = tbBlockObject;
    
    TBViewController2 *vc2 = [[TBViewController2 alloc] init];
    // 注意weak，否则会循环引用
    __weak typeof(vc2) weakVC2 = vc2;
    void(^myBlock)() = ^() {
        [weakVC2 doSomething];
    };
    
    // 赋值block
    vc2.myBlock = myBlock;
    tbBlockObject.myBlock = myBlock;
    
    // 执行
    vc2.myBlock();
    tbBlockObject.myBlock();
    
    [self.navigationController pushViewController:vc2 animated:YES];
}

- (void)setupButton2 {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    button.frame = CGRectMake(150, 250, 100, 50);
    [button setTitle:@"excuteBlock" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(enter2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)enter2 {
    [self.tbBlockObject excuteTBBlockObject];
}

- (void)setupButton1 {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    button.frame = CGRectMake(150, 150, 100, 50);
    [self.view addSubview:button];
    [button setTitle:@"进入VC2" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enter1) forControlEvents:UIControlEventTouchUpInside];
}

- (void)enter1 {
    TBViewController2 *vc = [[TBViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}



@end
