//
//  FQSearchService.m
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import "FQSearchService.h"
#import "FQVenue.h"

NSString * const FQ_SECRET_KEY = @"EGJPYWOZBVQ5DKEJOFGMSKQJLXZW3FFMNIRUUHOM21QLBYKK";
NSString * const FQ_CLIENT_ID = @"QHF4MRCOOYBUATUF4ODJLS3A5CPJH4IMUCP0R5VE4WPSMKDJ";

NSString * const FQ_EXPLORE_VENUES_URL = @"://api.foursquare.com/v2/venues/explore";

@implementation FQSearchService

- (void) searchVenues:(NSString *)searchText completionHandler:(void (^)(NSArray *venues, NSError* error)) completioHandler {

	NSString *encodedSearchText = [searchText stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd/MM/yyyy"];
	NSString *version = [formatter stringFromDate:[NSDate date]];
	
	NSString *baseURL = [NSString stringWithFormat:@"%@?"
						 @"near=%@"
						 @"v=%@"
						 @"client_id=%@"
						 @"client_secret=%@",
						 FQ_EXPLORE_VENUES_URL,
						 encodedSearchText,
						 version,
						 FQ_CLIENT_ID,
						 FQ_SECRET_KEY];
	
	NSURL *url = [NSURL URLWithString:baseURL];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	
	NSURLSession *session = [NSURLSession sharedSession];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
		NSMutableDictionary * venues;
		if(data && httpResponse.statusCode == 200) {
			venues = [NSMutableDictionary dictionary];
			NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
			
			NSArray *venuesObjects = resultDict[@"response"][@"groups"][@"groups"][@"items"];
			for (NSDictionary *venueDict in venuesObjects) {
				
				
			}
			
			//TODO: parse the objects
			
		}
		
		completioHandler([venues copy], error);
	}] resume];
}


@end
