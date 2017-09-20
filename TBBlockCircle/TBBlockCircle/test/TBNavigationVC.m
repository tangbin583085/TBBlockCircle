//
//  TBNavigationVC.m
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/12.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBNavigationVC.h"

@interface TBNavigationVC ()

@end

@implementation TBNavigationVC

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor redColor]];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor greenColor];
    [item setTintColor:[UIColor yellowColor]];
    [item setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20.0]} forState:UIControlStateNormal];
}


- (void)dealloc {
    NSLog(@"%s", __func__);

}



@end
