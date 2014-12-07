//
//  NS-Extension.h
//  GreenDemo
//
//  Created by Li Zeng on 3/12/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (GreenDemo)

- (UIImage *) makeThumbnailOfSize:(CGSize)size; // Get smaller image
- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

@end
