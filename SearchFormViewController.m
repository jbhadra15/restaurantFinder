//
//  SearchFormViewController.m
//  APITest
//
//  Created by Jen Patten on 2/17/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import "SearchFormViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SearchFormViewController ()

@end

@implementation SearchFormViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   // [self.restaurantTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat imageWidth = self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    
        UIImage *cuisineImage = [UIImage imageNamed:@"Indian.jpg"];
        UIImageView *cuisineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, screenHeight)];
        [cuisineImageView setImage:cuisineImage];
        [cuisineImageView setClipsToBounds:YES];
        [cuisineImageView setContentMode:UIViewContentModeScaleAspectFill];
        //[cuisineImageView setAlpha:0.5f];
        [self.view addSubview:cuisineImageView];

    
    self.restaurantTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 125, 250, 40)];
    self.restaurantTypeLabel.clipsToBounds = YES;
    [[self.restaurantTypeLabel layer] setCornerRadius:15];
    self.restaurantTypeLabel.text = @"  What type of food are you craving?  ";
    self.restaurantTypeLabel.textColor =[UIColor blackColor];
   // [restaurantTypeLabel setFont:[UIFont systemFontOfSize:12]];
    self.restaurantTypeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.restaurantTypeLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.restaurantTypeLabel.layer.borderWidth = 1.0;
    self.restaurantTypeLabel.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *theSpeedTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(restaurantLabelTapped:)];
    [self.restaurantTypeLabel addGestureRecognizer:theSpeedTapped];
    self.restaurantTypeLabel.userInteractionEnabled = YES;

  //  [restaurantTypeLabel addTarget:self action:@selector(restaurantFieldTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 210, 100, 40)];
    locationLabel.text = @"Location";
    locationLabel.textColor =[UIColor blackColor];
   // [locationLabel setFont:[UIFont systemFontOfSize:12]];
    locationLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];


    //Restaurant Type textfield
    self.restaurantTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, 140, 150, 20)];
    self.restaurantTextField.textColor = [UIColor blackColor];
    self.restaurantTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.restaurantTextField.backgroundColor=[UIColor whiteColor];
    //restaurantTextField.text=@"Restaurant Type";
    self.restaurantTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    
    //Location textfield
    self.locationTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, 220, 150, 20)];
    self.locationTextField.textColor = [UIColor blackColor];
    self.locationTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.locationTextField.backgroundColor=[UIColor whiteColor];
    //locationTextField.text=@"Location";
    self.locationTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    
    
    //Search Button
    
    UIButton *searchYelpButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 300, 75, 30)];
    [searchYelpButton setTitle:@"Search" forState:UIControlStateNormal];
    [searchYelpButton setBackgroundColor:[UIColor whiteColor]];
    [searchYelpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchYelpButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [searchYelpButton addTarget:self action:@selector(searchButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchYelpButton];

    //[self.view addSubview:self.restaurantTextField];
    [self.view addSubview:self.locationTextField];
    [self.view addSubview:self.restaurantTypeLabel];
    [self.view addSubview:locationLabel];
    [self.view addSubview:searchYelpButton];
    
}

// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [dataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [dataArray objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [dataArray objectAtIndex: row]);
    self.restaurantText = [dataArray objectAtIndex:row];
   NSLog(@"You selected this AGAIN: %@", self.restaurantText);
}


-(void)restaurantLabelTapped:(id) sender {
    //Data Array of UIPickerView
    if(dataArray == nil){
    dataArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray addObject:@"American"];
    [dataArray addObject:@"Sushi"];
    [dataArray addObject:@"Italian"];
    [dataArray addObject:@"Chinese"];
    [dataArray addObject:@"Indian"];
    [dataArray addObject:@"Ethiopian"];
    [dataArray addObject:@"Thai"];
    [dataArray addObject:@"Japanese"];
    [dataArray addObject:@"Peruvian"];
    [dataArray addObject:@"Cantonese"];
    [dataArray addObject:@"German"];
    [dataArray addObject:@"French"];
    [dataArray addObject:@"Tapas"];
    }
    
    // Init the picker view.
    if(pickerView == nil){
    pickerView = [[UIPickerView alloc] init];
        // Set the delegate and datasource. Don't expect picker view to work
        // correctly if you don't set it.
        [pickerView setDataSource: self];
        [pickerView setDelegate: self];
        
        // Set the picker's frame. We set the y coordinate to 50px.
        [pickerView setFrame: CGRectMake(60, 400, 180, 180)];
        
        // Before we add the picker view to our view, let's do a couple more
        // things. First, let the selection indicator (that line inside the
        // picker view that highlights your selection) to be shown.
        pickerView.showsSelectionIndicator = YES;
        
        // Allow us to pre-select the third option in the pickerView.
        [pickerView selectRow:2 inComponent:0 animated:YES];
        
        // OK, we are ready. Add the picker in our view.
        [self.view addSubview: pickerView];

    }
    
    }
- (void)searchButtonTapped:(id)sender {
    
    if(self.restaurantText == nil){
        self.restaurantText = @"Italian";
    }
    //self.restaurantText = self.restaurantTextField.text;
    self.locationText = self.locationTextField.text;
    
    ViewController *viewController = [[ViewController alloc]init];
    [viewController setSearchTerms: self.restaurantText location: self.locationText];
    //self.restaurantTextField.text = nil;
    self.locationTextField.text = nil;
     [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
