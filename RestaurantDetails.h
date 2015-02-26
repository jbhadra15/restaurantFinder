//
//  RestaurantDetails.h
//  APITest
//
//  Created by Jen Patten on 2/16/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface RestaurantDetails : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryFromJSON;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSURL *imageURL;
@property (nonatomic, readonly) NSURL *businessURL;
@property (nonatomic, readonly) NSURL *ratingImageURL;
@property (nonatomic, readonly) NSString *streetAddress1;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly, assign) CLLocationDegrees latitude;
@property (nonatomic, readonly, assign) CLLocationDegrees longitude;
@property (nonatomic, readonly) NSString *snippetText;
@property (nonatomic, readonly) NSString *phoneNumber;
@property (nonatomic, readonly) NSString *reviewCount;

@end
