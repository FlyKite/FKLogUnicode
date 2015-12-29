//
//  NSObject+ExchangeMethod.m
//  面向切面编程（AOP）
//  ingmeng
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
@end
