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
    }
    return 0;
}
