//
//  UIColor_Categories.h
//
//  Created by Matthias Bauch on 24.11.10.
//  Copyright 2010 Matthias Bauch. All rights reserved.
//


//
//  UIColor_Categories.m
//
//  Created by Matthias Bauch on 24.11.10.
//  Copyright 2010 Matthias Bauch. All rights reserved.
//

#import "UIColor_Categories.h"

@implementation UIColor(MBCategory)

// takes @"#123456"
+ (UIColor *)colorWithHexString:(NSString *)str alpha:(float)alpha{
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor colorWithHex: (int)x alpha: alpha];
}

// takes 0x123456
+ (UIColor *)colorWithHex:(UInt32)col  alpha:(float)alpha{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha: alpha];
}



@end