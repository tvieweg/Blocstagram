//
//  BLCLikeCountLabel.m
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/2/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import "BLCLikeCountLabel.h"

@implementation BLCLikeCountLabel

- (void)drawTextInRect:(CGRect)rect {
    CGPoint rectOrigin = CGPointMake(self.bounds.origin.x, self.bounds.origin.y + 8);
    CGRect textRect = CGRectMake(rectOrigin.x, rectOrigin.y, 25, 25);
    [super drawTextInRect:textRect];
}

-(void) setTextWithInteger:(NSInteger)likeCount {
    if (likeCount < 1000) {
        self.text = [NSString stringWithFormat:@"%ld", (long)likeCount];
    } else if (likeCount <1000000) {
        int dividedCount = (int)likeCount / 1000;
        self.text = [NSString stringWithFormat:@"%dk", dividedCount];
    } else {
        int dividedCount = (int)likeCount / 1000000;
        self.text = [NSString stringWithFormat:@"%dM", dividedCount];
    }
}

@end
