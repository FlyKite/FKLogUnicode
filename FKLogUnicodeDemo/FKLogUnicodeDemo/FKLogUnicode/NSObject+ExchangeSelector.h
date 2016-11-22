//
//  NSObject+ExchangeMethod.h
//  FKLogUnicodeDemo
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

/**
 *  @method replaceUnicode:
 *  将字符串中的Unicode编码字符（如\Uxxxx等）转为汉字
 *
 *  @param unicodeStr 希望转换的字符串
 *  @return 将\U转为汉字后的字符串
 */
- (NSString *)replaceUnicode:(NSString *)unicodeStr;
@end
