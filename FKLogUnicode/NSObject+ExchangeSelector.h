//
//  NSObject+ExchangeMethod.h
//  ingmeng
//
//  Created by 风筝 on 15/12/29.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ExchangeSelector)
/**
 *  @method aop_ExchangeSelector:andNewSelector:
 *  交换两个SEL指向的方法的指针
 *  如：将description与new_description的指针交换之后，执行description方法实际上将会执行自己写的new_description方法
 */
+ (void)exchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel;
@end
