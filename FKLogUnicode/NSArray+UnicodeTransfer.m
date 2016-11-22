//
//  NSArray+UnicodeTransfer.m
//  使用NSLog(@"%@", array)将NSArray打印出时，中文不再显示乱码（将Unicode编码转为汉字）
//  FKLogUnicode
//
//  Created by 风筝 on 15/12/29.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import "NSArray+UnicodeTransfer.h"
#import "NSObject+ExchangeSelector.h"

@implementation NSArray (UnicodeTransfer)
+ (void)load {
    // 该方法会在加载这个类的时候执行（APP启动时会加载，只执行一次）
    // 此处交换descriptionWithLocale:与自己写的my_descriptionWithLocale:的方法指针
    [self exchangeSelector:@selector(descriptionWithLocale:) andNewSelector:@selector(my_descriptionWithLocale:)];
}

- (NSString *)my_descriptionWithLocale:(id)locale {
    NSString *desc = [self my_descriptionWithLocale:locale];
    desc = [self replaceUnicode:desc];
    return desc;
}
@end
