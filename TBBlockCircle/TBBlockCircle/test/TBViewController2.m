//
//  TBNavViewController.m
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/12.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBViewController2.h"
#import "TBBlockObject.h"

@interface TBViewController2 ()


@property (nonatomic, strong)TBBlockObject *tbObject;

@property (nonatomic, assign)int bb;

@end

@implementation TBViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    
//    [self blockWithSelf];
//    [self blockWithSelfSolution];
    
//    [self block2Object];
//    [self block2ObjectSolution];
    
//    [self dispachBlock];
//    [self dispachBlockSolution];
    
    
    
}


- (void)dispachBlock {
    // CGD 绝大部分都不会产生循环引用
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self doSomething];
//    });
    
    // 如果对对象本身对 block持有，也会出现循环引用
    void(^myBlock)() = ^{
        [self doSomething];
    };
    self.myBlock = myBlock;
    dispatch_async(dispatch_get_main_queue(), myBlock);
}

- (void)dispachBlockSolution {
    
    // 如果对对象本身对 block持有，使用weakSelf
    __weak typeof (self) weakSelf = self;
    void(^myBlock)() = ^{
        [weakSelf doSomething];
    };
    self.myBlock = myBlock;
    dispatch_async(dispatch_get_main_queue(), myBlock);
}

// 复杂不容易发现
- (void)block2Object {
    TBBlockObject *tbObject = [[TBBlockObject alloc] init];
    self.tbObject = tbObject;
    tbObject.myBlock = ^{
        [self doSomething];
    };
}

- (void)block2ObjectSolution {
    TBBlockObject *tbObject = [[TBBlockObject alloc] init];
    self.tbObject = tbObject;
    __weak typeof (self) weakSelf = self;
    tbObject.myBlock = ^{
        [weakSelf doSomething];
    };
}

// 简单容易发现
- (void)blockWithSelf{
    
    // 发出警告
    self.myBlock = ^() {
        [self doSomething];
    };
    self.myBlock();
    
    // 不会发出警告
//    void(^myBlock)() = ^() {
//        [self doSomething];
//    };
//    self.myBlock = myBlock;
//    myBlock();
}

- (void)blockWithSelfSolution{
    
    __weak typeof (self) weakSelf = self;
    self.myBlock = ^() {
        [weakSelf doSomething];
    };
    self.myBlock();
}

- (void)doSomething {
    NSLog(@"%s", __func__);
    NSLog(@"%@", self);
}

- (void)excuteMyBlock {
    self.myBlock();
}


- (void)dealloc {
    NSLog(@"%s", __func__);
    
}



@end
