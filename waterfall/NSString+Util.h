//
//  NSString+ArrayUtil.h
//  wallintermobile
//
//  Created by lance on 13-11-26.
//  Copyright (c) 2013年 ganchengkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

//将float数组转化为对象数组
- (void) convertToArray:(float*)rotatef;
/** 将场景对应的参数解析成一个包含多个字符的数组中 每个字符串的最后一位代表纹理类型 */
-(NSMutableArray *) convertToNSArray;
+(NSString *) arrConvertToString:(NSMutableArray *) rotatefs;

//将float数组转化为字符串
+ (NSString *) convertToString:(float*)rotatef;

//判断字符串是否为null
+ (BOOL) isNull:(NSString *)string;

-(NSString *) md5HexDigest;

@end
