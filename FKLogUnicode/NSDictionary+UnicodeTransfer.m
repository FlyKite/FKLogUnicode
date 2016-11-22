//
//  NSObject+UnicodeTransfer.m
//  使用NSLog(@"%@", array)将NSDictionary打印出时，中文不再显示乱码（将Unicode编码转为汉字）
//  FKLogUnicode
//
//  Created by 风筝 on 15/12/29.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import "NSDictionary+UnicodeTransfer.h"
#import "NSObject+ExchangeSelector.h"

@implementation NSDictionary (UnicodeTransfer)
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

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
@end
