//
//  TBNavViewController.h
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/12.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBViewController2 : UIViewController

@property (nonatomic, copy)void(^myBlock)();

- (void)excuteMyBlock;

- (void)doSomething;

@end
