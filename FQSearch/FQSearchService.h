//
//  FQSearchService.h
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQSearchService : NSObject

/*
 Search for venues using the FourSquare venue explore service
 */
- (void) searchVenues:(NSString *)searchText completionHandler:(void (^)(NSArray *venues, NSError* error)) completioHandler;

@end
