//
//  main.m
//  FKLogUnicodeDemo
//
//  Created by 风筝 on 15/12/29.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 只需要将那几个分类导入到项目中即可生效
        // Just import those categories into your project, then it will effects.
        NSDictionary *dict = @{
                               @"作者" : @"FlyKite",
                               @"作用" : @"让NSLog输出字典和数组的时候输出汉字而不是Unicode编码"
                               };
        NSLog(@"%@", dict);
        dict = @{@"数组":@[@"哈哈", @"附近的时刻", @"范德萨"], @"字典2":@{@"数组3":@[@1, @2, @3], @"字符串":@"附近的开始", @"字典":@{@"数组5":@[@3, @2,@1]}}};
        NSLog(@"%@", dict);
    }
    return 0;
}
