//
//  TBBlockObject.h
//  com.pintu.aaaaaa
//
//  Created by hanchuangkeji on 2017/9/20.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBBlockObject : NSObject

@property (nonnull, copy)void(^myBlock)();

- (void)excuteTBBlockObject;



@end
