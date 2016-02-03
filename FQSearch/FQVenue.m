//
//  FQVenue.m
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import "FQVenue.h"

@interface FQVenue()

@property (nonatomic, readwrite, copy) NSString *venueId;
@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, copy) NSString *categoryName;

@end

@implementation FQVenue

- (instancetype) initWithID:(NSString*)venueId name:(NSString*)name categoryName:(NSString *)categoryNanme {
	self = [super init];
	if (self) {
		self.venueId = venueId;
		self.name = name;
		self.categoryName = categoryNanme;
	}
	return  self;
}

@end
