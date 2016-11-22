//
//  NSObject+ExchangeMethod.m
//  面向切面编程（AOP）
//  FKLogUnicodeDemo
//
//  Created by 风筝 on 15/12/29.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import "NSObject+ExchangeSelector.h"
#import <objc/runtime.h>

@implementation NSObject (ExchangeSelector)
+ (void)exchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel {
    Method oldMethod =  class_getInstanceMethod([self class], oldSel);
    Method newMethod  = class_getInstanceMethod([self class], newSel);
    // 改变两个方法的具体指针指向
    method_exchangeImplementations(oldMethod, newMethod);
}

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSData *data = [unicodeStr dataUsingEncoding:NSUTF8StringEncoding];
    const uint8_t *bytes = data.bytes;
    NSMutableString *mStr = [NSMutableString string];
    for (NSInteger i = 0; i < data.length; i++) {
        if (i + 5 < data.length && bytes[i] == '\\' && bytes[i+1] == 'U') {
            uint8_t byte1 = [self convertHex:bytes[i + 2]];
            uint8_t byte2 = [self convertHex:bytes[i + 3]];
            uint8_t byte3 = [self convertHex:bytes[i + 4]];
            uint8_t byte4 = [self convertHex:bytes[i + 5]];
            if (byte1 && byte2 && byte3 && byte4) {
                unichar c = byte1 * 4096 + byte2 * 256 + byte3 * 16 + byte4 - 4369;
                NSString *tstr = [NSString stringWithCharacters:&c length:1];
                [mStr appendString:tstr];
                i += 5;
            } else {
                [mStr appendFormat:@"%c", bytes[i]];
            }
        } else {
            [mStr appendFormat:@"%c", bytes[i]];
        }
    }
    return [mStr copy];
}

- (uint8_t)convertHex:(uint8_t)byte {
    if (byte >= 48 && byte <= 57) {
        return byte - 48 + 1;
    }
    if (byte >= 97 && byte <= 102) {
        return byte - 87 + 1;
    }
    if (byte >= 65 && byte <= 80) {
        return byte - 55 + 1;
    }
    return 0;
}
@end
