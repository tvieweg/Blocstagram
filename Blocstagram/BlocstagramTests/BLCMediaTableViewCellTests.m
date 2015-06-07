//
//  BLCMediaTableViewCellTests.m
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/5/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMediaTableViewCell.h"
#import "BLCMedia.h"

@interface BLCMediaTableViewCellTests : XCTestCase

@end

@implementation BLCMediaTableViewCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHeightForPicture {
    NSDictionary *mediaSourceDictionary = @{@"id": @"8675309",
                                            @"user" : @{ @"id" : @"8675309",
                                                         @"username" : @"d'oh",
                                                         @"full_name" : @"Homer Simpson",
                                                         @"profile_picture" : @"http://www.example.com/example.jpg"},
                                            @"images" : @{@"standard_resolution" : @{@"url" : @"www.testurl.com"}},
                                            @"caption" : @{@"text" : @"test text"},
                                            @"comments" : @{@"data": @[@{@"id": @"8675309",
                                                                         @"text" : @"Sample Comment",
                                                                         @"from" : @{@"id" : @"8675309",
                                                                                                 @"username" : @"d'oh",
                                                                                                 @"full_name" : @"Homer Simpson",
                                                                                                 @"profile_picture" : @"http://www.example.com/example.jpg"}}]},
                                            @"user_has_liked": @0,
                                            @"likes" : @{@"count" : @10}
                                            };
    
    UIImage *testImage = [UIImage imageNamed:@"1.jpg"];
    BLCMedia *mediaItem = [[BLCMedia alloc] initWithDictionary:mediaSourceDictionary];
    mediaItem.image = testImage;
    
    CGFloat output = [BLCMediaTableViewCell heightForMediaItem:mediaItem width:200];
    
    XCTAssertEqual(output, (float) 390, "Height should be 390");
    
    testImage = [UIImage imageNamed:@"3.jpg"];
    mediaItem.image = testImage;
    
    output = [BLCMediaTableViewCell heightForMediaItem:mediaItem width:200];
    NSLog(@"%f", output);
    
    XCTAssertEqual(output, (float) 390, "Height should be 390");
    
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
