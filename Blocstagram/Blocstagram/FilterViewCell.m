//
//  FilterViewCell.m
//  
//
//  Created by Trevor Vieweg on 6/5/15.
//
//

#import "FilterViewCell.h"

@interface FilterViewCell ()

@end

static NSInteger imageViewTag = 1000;
static NSInteger labelTag = 1001;

@implementation FilterViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.label = [[UILabel alloc] init];
        self.label.tag = labelTag;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        [self addSubview:self.label];
        
        self.thumbnail = [[UIImageView alloc] init];
        self.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnail.tag = imageViewTag;
        self.thumbnail.clipsToBounds = YES;
        [self addSubview:self.thumbnail]; 
    }
    
    return self;
}

@end
