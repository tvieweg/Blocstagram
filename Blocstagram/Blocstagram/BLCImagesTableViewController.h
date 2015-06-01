//
//  BLCImagesTableViewController.h
//  Blocstagram
//
//  Created by Trevor Vieweg on 5/21/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCMediaTableViewCell.h"

@interface BLCImagesTableViewController : UITableViewController

- (void) cell:(BLCMediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView; 

@end
