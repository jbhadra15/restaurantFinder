//
//  DetailRestaurantViewController.m
//  APITest
//
//  Created by Jen Patten on 2/8/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import "DetailRestaurantViewController.h"
#import "ViewController.h"
#import "RestaurantDetails.h"

@interface DetailRestaurantViewController ()
@property (nonatomic, strong) MKMapView *map;

@end

@implementation DetailRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UILabel *restaurantNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, 300, 75)];
    UILabel *restaurantCityLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 65, 300, 75)];
    [restaurantCityLabel setFont:[UIFont systemFontOfSize:12]];
    UILabel *urlAddressLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 85, 300, 75)];
    [urlAddressLabel setFont:[UIFont systemFontOfSize:9]];

    NSURL *url = self.restaurantDetails.businessURL;

    NSData *ratingsImageData = [NSData dataWithContentsOfURL:self.restaurantDetails.ratingImageURL];
    UIImage *ratingsImage = [[UIImage alloc] initWithData:ratingsImageData];
    UIImageView *ratingsImageView = [[UIImageView alloc] initWithImage:ratingsImage];
    ratingsImageView.frame = CGRectMake(15, 135, 100, 25);
       
    NSData *imageData = [NSData dataWithContentsOfURL:self.restaurantDetails.imageURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(15, 175, 100, 100);
    
    //Adding map tp
    self.map = [[MKMapView alloc] initWithFrame:CGRectMake(15, 300, 300, 200)];
    //self.map.mapType = MKMapTypeHybrid;
    self.map.delegate = self;
    self.map.mapType = MKMapTypeStandard;
//    self.map.showsUserLocation = YES;

    restaurantNameLabel.text = self.restaurantDetails.name;
    restaurantCityLabel.text = [NSString stringWithFormat:@"%@, %@", self.restaurantDetails.streetAddress1, self.restaurantDetails.city];
    urlAddressLabel.text = [NSString stringWithFormat:@"%@",self.restaurantDetails.businessURL];
    
    imageView.image = image;

    
    self.phoneNumberButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 200, 150, 50)];
    [self.phoneNumberButton setTitle:@"Call Now" forState:UIControlStateNormal];
    self.phoneNumber = self.restaurantDetails.phoneNumber;
    [self.phoneNumberButton setBackgroundColor:[UIColor whiteColor]];
    [self.phoneNumberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self.phoneNumberButton layer] setBorderWidth:3.0f];
    [[self.phoneNumberButton layer] setBorderColor:[UIColor blackColor].CGColor];
    // [self.phoneNumberButton setFont:[UIFont systemFontOfSize:10]];
    [self.phoneNumberButton addTarget:self action:@selector(phoneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.phoneNumberButton];
    
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude = self.restaurantDetails.latitude;
    pinCoordinate.longitude = self.restaurantDetails.longitude;
    myAnnotation.coordinate = pinCoordinate;
    myAnnotation.title = self.restaurantDetails.name;
    //myAnnotation.subtitle = addressValue;
    
     [self.view addSubview:imageView];
     [self.view addSubview:restaurantNameLabel];
     [self.view addSubview:urlAddressLabel];
     [self.view addSubview:restaurantCityLabel];
     [self.view addSubview:ratingsImageView];

     [self.view addSubview:self.map];
     [self.map addAnnotation:myAnnotation];
    
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region;
    region.center.latitude = self.restaurantDetails.latitude;
    region.center.longitude = self.restaurantDetails.longitude;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    [self.map setRegion:region animated:YES];
   
}


-(void)phoneButtonTapped:(id)sender {
   // NSString *urlString = [NSString stringWithFormat: self.phoneNumber];
            //               NSURL *url = [NSURL URLWithString: urlString];
   // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://2135554321"]];
    NSString *message = [NSString stringWithFormat:@"telprompt://%@",
                         self.phoneNumber];
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:message]];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
//            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //pinView.image = [UIImage imageNamed:@"pizza_slice_32.png"];
//            pinView.calloutOffset = CGPointMake(0, 32);
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSLog(@"Location in view (%f,%f) ",location.x, location.y);
}


@end
