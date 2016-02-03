//
//  FQSearchService.m
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import "FQSearchService.h"

NSString * const FQ_SECRET_KEY = @"EGJPYWOZBVQ5DKEJOFGMSKQJLXZW3FFMNIRUUHOM21QLBYKK";
NSString * const FQ_CLIENT_ID = @"QHF4MRCOOYBUATUF4ODJLS3A5CPJH4IMUCP0R5VE4WPSMKDJ";

@implementation FQSearchService

- (void) searchVenues:(NSString *)searchText completionHandler:(void (^)(NSArray *venues, NSError* error)) completioHandler {
	//TODO: implement
	
	completioHandler(nil, nil);
}


@end
