//
//  BLCMediaTableViewCell.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 5/21/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCMedia, BLCMediaTableViewCell, BLCComposeCommentView;

@protocol BLCMediaTableViewCellDelegate <NSObject>

- (void) cell:(BLCMediaTableViewCell *)cell didTapImageView:(UIImageView *)imageView;

- (void) cell:(BLCMediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;

- (void) didPressCellWithTwoFingers:(BLCMediaTableViewCell *)cell;
- (void) cellDidPressLikeButton:(BLCMediaTableViewCell *)cell;

- (void) cellWillStartComposingComment:(BLCMediaTableViewCell *)cell;
- (void) cell:(BLCMediaTableViewCell *)cell didComposeComment:(NSString *)comment;

@end

@interface BLCMediaTableViewCell : UITableViewCell

@property (nonatomic, strong) BLCMedia *mediaItem;
@property (nonatomic, weak) id <BLCMediaTableViewCellDelegate> delegate;
@property (nonatomic, strong, readonly) BLCComposeCommentView *commentView;


+ (CGFloat) heightForMediaItem:(BLCMedia *)mediaItem width:(CGFloat)width; 

- (void) stopComposingComment;

@end
