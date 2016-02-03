//
//  FQSearchTests.m
//  FQSearchTests
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FQVenue.h"

@interface FQVenueTests : XCTestCase

@end

@implementation FQVenueTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testInitialization {
	NSString *venueId = @"123";
	NSString *name = @"venue name";
	NSString *categoryName = @"category";
	
	FQVenue *venue = [[FQVenue alloc] initWithID:venueId name:name categoryName:categoryName];
	
	XCTAssertEqualObjects(venue.venueId, venueId);
	XCTAssertEqualObjects(venue.name, name);
	XCTAssertEqualObjects(venue.categoryName, categoryName);
}


@end
