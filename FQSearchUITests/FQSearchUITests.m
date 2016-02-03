//
//  FQSearchUITests.m
//  FQSearchUITests
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FQSearchUITests : XCTestCase {
	XCUIApplication *app;
}

@end

@implementation FQSearchUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    app = [[XCUIApplication alloc] init];
}

-(void)tearDown {
	app = nil;
	
	[super tearDown];
}

- (void)testSearchForLondon {
	[self searchUsingText:@"London"];
	
	//this results shoudl be in the list, we should be able to selecte them
	XCUIElement *fqSearchTableViewTable = app.tables[@"fq_search__table_view"];
	[fqSearchTableViewTable.staticTexts[@"Hyde Park"] tap];
	[fqSearchTableViewTable.staticTexts[@"Hampstead Heath"] tap];
	[fqSearchTableViewTable.staticTexts[@"Greenwich Park"] tap];
}

- (void) testSearchWithLessThanThreeChars {
	[self searchUsingText:@"ln"];
	
	//an alert should be present
	[app.alerts[@"Search to short"].collectionViews.buttons[@"OK"] tap];
}

- (void) searchUsingText:(NSString*)searchText {
	
	XCUIElement *searchForVenuesSearchField = app.tables[@"fq_search__table_view"].searchFields[@"Search for venues"];
	[searchForVenuesSearchField tap];
	[searchForVenuesSearchField typeText:searchText];
	[app.buttons[@"Search"] tap];
}

@end
