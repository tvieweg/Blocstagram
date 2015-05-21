//
//  BLCDatasource.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 5/21/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLCDatasource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems; 

@end
