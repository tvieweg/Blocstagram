//
//  BLCLikeButton.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/2/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BLCLikeState) {
    BLCLikeStateNotLiked            = 0,
    BLCLikeStateLiking              = 1,
    BLCLikeStateLiked               = 2,
    BLCLikeStateUnliking            = 3
};

@interface BLCLikeButton : UIButton

@property (nonatomic, assign) BLCLikeState likeButtonState;

@end
