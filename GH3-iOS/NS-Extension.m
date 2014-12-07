//
//  NS-Extension.m
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "NS-Extension.h"

@implementation UIImage (GreenDemo)

// Get smaller image

- (UIImage *) makeThumbnailOfSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    // draw scaled image into thumbnail context
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newThumbnail = UIGraphicsGetImageFromCurrentImageContext();
    // pop the context
    UIGraphicsEndImageContext();
    if(newThumbnail == nil)
        NSLog(@"could not scale image");
    return newThumbnail;
}

- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
