//
//  BLCCameraViewController.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/3/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCCameraViewController;

@protocol BLCCameraViewControllerDelegate <NSObject>

- (void) cameraViewController:(BLCCameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end


@interface BLCCameraViewController : UIViewController

@property (nonatomic, weak) NSObject <BLCCameraViewControllerDelegate> *delegate;

@end
