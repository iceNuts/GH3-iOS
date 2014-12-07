//
//  UIColor_Categories.h
//  Carlor
//
//  Created by Li Zeng on 10/28/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor(MBCategory)

+ (UIColor *)colorWithHex:(UInt32)col;
+ (UIColor *)colorWithHexString:(NSString *)str alpha: (float)alpha;
@end


