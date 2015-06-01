//
//  BLCMediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Trevor Vieweg on 5/28/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import "BLCMediaFullScreenViewController.h"
#import "BLCImagesTableViewController.h"
#import "BLCMedia.h"

@interface BLCMediaFullScreenViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) BLCMedia *media;

@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, weak) UIButton *shareButton;

@end

@implementation BLCMediaFullScreenViewController

const int relativeHeightPaddingFactor = 30;
const int relativeItemHeightFactor = 10;

- (instancetype) initWithMedia:(BLCMedia *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
    return self;
}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.media.image.size;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.shareButton];
    [self.shareButton setTitle: NSLocalizedString(@"Share", @"Share command") forState:UIControlStateNormal];
    self.shareButton.backgroundColor = [UIColor whiteColor];
    self.shareButton.alpha = 0.75;
    
    [self.shareButton addTarget:self action:@selector(shareButtonWasPressed) forControlEvents:UIControlEventTouchUpInside];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //set parameters for views based on iPhone 4 and 5 screen sizes.
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat padding = self.view.frame.size.height / relativeHeightPaddingFactor;
    CGFloat itemHeight = self.view.frame.size.height / relativeItemHeightFactor;
    
    self.shareButton.frame = CGRectMake(0, padding, viewWidth, itemHeight);
    
    
    self.scrollView.frame = self.view.bounds;
    
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
}

- (void)centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void) scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}

#pragma mark - Gesture Recognizers

- (void) tapFired:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    } else {
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}

- (void) shareButtonWasPressed {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (self.media.caption.length > 0) {
        [itemsToShare addObject:self.media.caption];
    }
    
    if (self.imageView.image) {
        [itemsToShare addObject:self.imageView.image];
    }
    
    if (itemsToShare.count > 0) {
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }
}

@end
