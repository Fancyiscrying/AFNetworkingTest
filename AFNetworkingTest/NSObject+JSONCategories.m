//
//  NSObject+JSONCategories.m
//  SmartPen
//
//  Created by Mac on 2015/9/23.
//  Copyright (c) 2015年 F7684336. All rights reserved.
//

#import "NSObject+JSONCategories.h"

@implementation NSObject (JSONCategories)

-(NSData*)JSONString
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
