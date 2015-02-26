//
//  ViewController.h
//  APITest
//
//  Created by Jen Patten on 2/8/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSURLRequest+OAuth.h"
#import "RestaurantSummaryViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate>
@property (nonatomic, strong) NSString *restaurantText;
@property (nonatomic, strong) NSString *locationText;
@property (nonatomic, strong) RestaurantSummaryViewCell *cell;
-(void)setSearchTerms:(NSString *) restaurantType location:(NSString *)locationDetails;

@end

