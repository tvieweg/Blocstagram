//
//  BLCComposeCommentViewTests.m
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/5/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCComposeCommentView.h"

@interface BLCComposeCommentViewTests : XCTestCase

@end

@implementation BLCComposeCommentViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSettingTextWithText {
    NSString *sampleString = @"Sample text";
    
    BLCComposeCommentView *composeView = [[BLCComposeCommentView alloc] init];
    
    [composeView setText:sampleString];
    
    XCTAssertEqual(composeView.isWritingComment, YES);
    
}

- (void)testSettingTextWithNoText {
    NSString *sampleString = @"";
    
    BLCComposeCommentView *composeView = [[BLCComposeCommentView alloc] init];
    
    [composeView setText:sampleString];
    
    XCTAssertEqual(composeView.isWritingComment, NO);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
