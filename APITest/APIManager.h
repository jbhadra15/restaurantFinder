

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void)resultForSearchTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSArray *restaurantDetails, NSError *error))completionHandler;

@end
