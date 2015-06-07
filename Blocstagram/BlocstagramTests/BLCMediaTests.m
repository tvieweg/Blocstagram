//
//  BLCMediaTests.m
//  Blocstagram
//
//  Created by Trevor Vieweg on 6/5/15.
//  Copyright (c) 2015 Trevor Vieweg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMedia.h"
#import "BLCComment.h"
#import "BLCUser.h"



@interface BLCMediaTests : XCTestCase

@end

@implementation BLCMediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *userSourceDictionary = @{@"id": @"8675309",
                                       @"username" : @"d'oh",
                                       @"full_name" : @"Homer Simpson",
                                       @"profile_picture" : @"http://www.example.com/example.jpg"};
    
    NSDictionary *commentSourceDictionary = @{@"id": @"8675309", @"text" : @"Sample Comment"};
    
    BLCComment *commentSource = [[BLCComment alloc] initWithDictionary:commentSourceDictionary];
    
    BLCUser *userSource = [[BLCUser alloc] initWithDictionary:userSourceDictionary];
    

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
    
    //Media to validate
    BLCMedia *testMedia = [[BLCMedia alloc] initWithDictionary:mediaSourceDictionary];
    
    //Comment to validate
    NSArray *comment = testMedia.comments;
    BLCComment *testComment = comment[0];
    
    XCTAssertEqualObjects(testMedia.idNumber, mediaSourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.user.userName, userSource.userName, @"The users should be equal. testMedia.user = %@, userSource = %@", testMedia.user, userSource);
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:@"www.testurl.com"], @"The mediaURL's should be equal");
    XCTAssertEqual(testMedia.downloadState, BLCMediaDownloadStateNeedsImage, @"The download state should be 'Needs image'");
    XCTAssertEqualObjects(testMedia.caption, @"test text", "Caption text is not correct");
    XCTAssertEqualObjects(testComment.idNumber, commentSource.idNumber, "Comments not found correctly");
    XCTAssertEqual(testMedia.likeState, BLCLikeStateNotLiked);
    XCTAssertEqual(testMedia.likeCount, (NSInteger) 10);
    
    
    

}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
