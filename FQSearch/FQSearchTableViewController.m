//
//  FQSearchTableViewController.m
//  FQSearch
//
//  Created by Tiago Santos on 03/02/2016.
//  Copyright © 2016 Tiago Santos. All rights reserved.
//

#import "FQSearchTableViewController.h"
#import "FQVenue.h"
#import "FQSearchService.h"

@interface FQSearchTableViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, copy) NSArray *venues;

@end

@implementation FQSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.venues.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FQSearchResultCellIdentifier" forIndexPath:indexPath];
	
	FQVenue *venue = self.venues[indexPath.row];
	
	[cell.textLabel setText:venue.name];
	[cell.detailTextLabel setText:venue.categoryName];
    return cell;
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	if (searchBar.text.length >= 3) {
		[searchBar resignFirstResponder];
		FQSearchService *searchService = [[FQSearchService alloc] init];
		__weak typeof(self) weakSelf = self;
		[searchService searchVenues:searchBar.text
				  completionHandler:^(NSArray *venues, NSError *error) {
					  if (!error && venues.count) {
						  weakSelf.venues = venues;
						  dispatch_async(dispatch_get_main_queue(), ^{
							  [weakSelf.tableView reloadData];
						  });
					  } else {
						  NSString *alertTitle;
						  NSString *alertMessage;
						  UIAlertAction *alertAction;;
						  if(error){
							  alertTitle = @"No venues found";
							  alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
								  [searchBar becomeFirstResponder];
							  }];
						  } else {
							  alertTitle = @"Error";
							  alertMessage = error.description;
							  alertAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
						  }
						  
						  UIAlertController * alert =   [UIAlertController
														 alertControllerWithTitle:alertTitle
														 message:alertMessage
														 preferredStyle:UIAlertControllerStyleAlert];
						  
						  [alert addAction:alertAction];
						  [weakSelf presentViewController:alert animated:YES completion:nil];
					  }
					  
		}];

	} else {
		UIAlertController * alert=   [UIAlertController
									  alertControllerWithTitle:@"Search to short"
									  message:@"The search text needs to have at least 3 characteres."
									  preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
		[self presentViewController:alert animated:YES completion:nil];
	}
}

@end
