//
//  FQVenue.h
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQVenue : NSObject

@property (nonatomic, readonly, copy) NSString *venueId;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *categoryName;

- (instancetype) initWithID:(NSString*)id name:(NSString*)name categoryName:(NSString *)categoryNanme;

@end
