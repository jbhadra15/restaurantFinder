//
//  RestaurantDetails.m
//  APITest
//
//  Created by Jen Patten on 2/16/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import "RestaurantDetails.h"

@implementation RestaurantDetails

- (instancetype)initWithDictionary:(NSDictionary *)business
{
    self = [super init];
    if (self) {
        
        _name = business[@"name"];
        
        NSString *image_url = business[@"image_url"];
        _imageURL = [NSURL URLWithString:image_url];
        
        
        NSDictionary *locationDetails = business[@"location"];
        NSString *cityValue = [locationDetails valueForKey:@"city"];
        NSArray *addressValue = [locationDetails valueForKey:@"address"];
        NSString *addressString = addressValue[0];
        
        _streetAddress1 = addressString;
        _city = cityValue;
        
        NSString *address_url = business[@"url"];
        NSURL *url = [[ NSURL alloc ] initWithString:address_url];

        _businessURL = url;
        
        NSString *ratingsImage_url = business[@"rating_img_url"];
        _ratingImageURL = [NSURL URLWithString:ratingsImage_url];
        
        NSDictionary *coordinates = locationDetails[@"coordinate"];
        NSNumber *latitudeObject = [coordinates valueForKey:@"latitude"];
        NSNumber *longitudeObject = [coordinates valueForKey:@"longitude"];
        CLLocationDegrees latitude = [latitudeObject doubleValue];
        CLLocationDegrees longitude = [longitudeObject doubleValue];
        
        _latitude = latitude;
        _longitude = longitude;
      
        _snippetText = business[@"snippet_text"];
        
        
        _phoneNumber = business[@"phone"];
        
        _reviewCount = business[@"review_count"];
        
        //rating = "3.5";
    }
    return self;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"%@ %@ %@",_name, _streetAddress1, _snippetText];
}

@end
