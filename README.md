# CodingAssignment

Implementation description:
- CatSpace is an universal application which uses "https://api.thecatapi.com" api interface for fetching sample list of cat pictures along with some description like id, height and width.
The application's home page shows a list of results from the api and it also has a detail page which shows a more detailed view of the item that is chosen in the list.


Requirements addressed:
- Created UI using auto layout and size classes. 
- Used CollectionView for displaying the grid with 4 items per row.
- Made use of SDWebImage pod for Image caching and ReachabilitySwift pod for checking Internet connectivity.
- Used CoreData to persist data for offline mode.
- Unit test cases added for CoreDataStack
- Used combine for Service layer

Tools used:
- xCode - 11.3
- Swift version - 5
- Minimum Deployment Target: iOS 13.2
