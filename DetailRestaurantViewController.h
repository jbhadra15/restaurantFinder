//
//  DetailRestaurantViewController.h
//  APITest
//
//  Created by Jen Patten on 2/8/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
@class RestaurantDetails;

@interface DetailRestaurantViewController : UIViewController <MKMapViewDelegate, MKAnnotation>

//@property (nonatomic, strong) NSDictionary *businessDetails;
@property (nonatomic, strong) RestaurantDetails *restaurantDetails;
@property (nonatomic, strong) UIButton *phoneNumberButton;
@property (nonatomic, strong) NSString *phoneNumber;


@end
