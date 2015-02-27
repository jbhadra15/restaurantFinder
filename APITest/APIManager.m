

#import "APIManager.h"
#import "NSURLRequest+OAuth.h"
#import "RestaurantDetails.h"

@implementation APIManager

+ (void)resultForSearchTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSArray *restaurantDetails, NSError *error))completionHandler {
    
    NSDictionary *params = @{
                             @"term": term,
                             @"location": location,
                             @"limit":  @"20"
                             };
  
    NSURLRequest *searchRequest = [NSURLRequest requestWithHost:@"api.yelp.com" path:@"/v2/search/" params:params];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:searchRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (!error && httpResponse.statusCode == 200) {
            NSDictionary *searchResponseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error]; // Parse JSON from data
            NSArray *restaurantDetails = [self restaurantDetailsFromResponse:searchResponseJSON];
             completionHandler(restaurantDetails, nil);
        } else {
          NSLog(@"Error");
            completionHandler(nil, error); // An error happened or the HTTP response is not a 200 OK
        }
    }] resume];
}

+ (NSArray *)restaurantDetailsFromResponse:(NSDictionary *)response
{
    // Return an array of restaurant details
    NSArray *businesses = [response valueForKey:@"businesses"];
    NSMutableArray *restaurantDetails = [NSMutableArray array];
    
    for (int i=0; i < [businesses count]; i++) {
        NSDictionary *business = businesses[i];
        RestaurantDetails *detail = [[RestaurantDetails alloc] initWithDictionary:business];
        [restaurantDetails addObject:detail];
    }
    
    return restaurantDetails;
}

@end
