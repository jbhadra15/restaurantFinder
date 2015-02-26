//
//  APIManager.h
//  APITest
//
//  Created by Jen Patten on 2/8/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void)resultForSearchTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSArray *restaurantDetails, NSError *error))completionHandler;

@end
