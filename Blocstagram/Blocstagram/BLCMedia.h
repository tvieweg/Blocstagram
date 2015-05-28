//
//  BLCMedia.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 5/21/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCUser;

@interface BLCMedia : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary; 

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) BLCUser *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image; 
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments; 

@end
