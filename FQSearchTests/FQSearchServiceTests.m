//
//  FQSearchServiceTests.m
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FQSearchService.h"
#import "FQVenue.h"

@interface FQSearchServiceTests : XCTestCase {
	FQSearchService *searchService;
}

@end

@implementation FQSearchServiceTests

- (void)setUp {
    [super setUp];
	searchService = [[FQSearchService alloc] init];
}

- (void)tearDown {
	searchService = nil;
    [super tearDown];
}

- (void)testSearchVenues{
	NSString *searchText = @"Picadilly Circus";
	
	XCTestExpectation *expectation = [self expectationWithDescription:@"Search venues expectation"];
	
	[searchService searchVenues:searchText completionHandler:^(NSArray *venues, NSError *error) {
		
		XCTAssertTrue(venues.count > 0);
		XCTAssertTrue([venues[0] isKindOfClass:FQVenue.class]);
		
		[expectation fulfill];
	}];
	
	
	[self waitForExpectationsWithTimeout:30.0 handler:^(NSError *error) {
		if (error) {
			NSLog(@"Timeout Error: %@", error);
		}
	}];
}


@end
