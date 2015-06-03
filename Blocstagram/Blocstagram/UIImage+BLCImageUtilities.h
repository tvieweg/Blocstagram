//
//  UIImage+BLCImageUtilities.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/3/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BLCImageUtilities)

- (UIImage *) imageByScalingToSize:(CGSize)size andCroppingWithRect:(CGRect)rect;

@end
