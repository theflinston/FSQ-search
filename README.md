# FSQ-search

This project is a simple example that shows how to integrate the FourSquare api, for iOS using Objective-C.

## Implementation
The implementation uses a simple TableViewController, where at the top has a search bar.
Once a text (location, place) is inserted in the search bar, and pressed the keyboard Search button a request is sent using the Foursquare api (FQSearchService), that returns the recomended places near the specified location (mapped into FQVenue objects).

Using a model MVC, being the table and the search bar the Views, the TableViewController the ontroller and the FQSeachrService and the FQVenue the Model, makes it easy to reuse the code. This cloud also be improve creating a diferent class to parse/map all the information returned from the api.

This project also has unit test that cover the creation of the FQVenue objects and the FQSearchService behaviour.

The UI test included in this project test all the components working together and the UI componets. 

## How to run
Download the project, open the FQSearch.xcodeproj file with Xcode 7.0 and run.
