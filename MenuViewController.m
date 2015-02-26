//
//  MenuViewController.m
//  APITest
//
//  Created by Jen Patten on 2/21/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) NSMutableArray *cuisines;

@property (nonatomic, strong) NSTimer *myTimer;

@end

@implementation MenuViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _cuisines = [NSMutableArray array];
        [_cuisines addObject:@"Indian.jpg"];
        [_cuisines addObject:@"Sushi.jpg"];
        [_cuisines addObject:@"Ceviche.jpg"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
   
    [self.navigationController setNavigationBarHidden:YES];

    //Add a ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [scrollView setDirectionalLockEnabled:YES];
    [scrollView setAlwaysBounceVertical:NO];
    [scrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [scrollView setContentSize:CGSizeMake(self.cuisines.count * self.view.bounds.size.width, self.view.bounds.size.height)];
    [scrollView setScrollEnabled:YES];
    [scrollView setBounces:NO];
    [scrollView setBouncesZoom:NO];
    
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    CGFloat xPosition = 0;
    CGFloat imageWidth = self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    for (NSString *cuisineName in self.cuisines) {
       
        UIImage *cuisineImage = [UIImage imageNamed:cuisineName];
        UIImageView *cuisineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, imageWidth, screenHeight)];
        [cuisineImageView setImage:cuisineImage];
        [cuisineImageView setClipsToBounds:YES];
        [cuisineImageView setContentMode:UIViewContentModeScaleAspectFill];

//        NSLog(@"Image View Frame %f,%f,%f,%f",xPosition,0.0,imageWidth,screenHeight);
        
        [self.scrollView addSubview:cuisineImageView];
        
        xPosition = xPosition + imageWidth;
    }
    
    
    // Add a button
//    self.selectButton = [[UIButton alloc] initWithFrame:CGRectZero];
//    [self.selectButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [self.selectButton setTitle:@"Select Cuisine" forState:UIControlStateNormal];
//    // Note button is added to the view not scrollview. See what happens
//    // when added to the scrollview
//    [self.view addSubview:self.selectButton];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)timerFired:(id)sender
{
    // Each timer the timer fires
    static int timerFireCount = 0;
    timerFireCount += 1;
    
    int photoToBeOn = timerFireCount % 3;
    CGFloat xPosition = photoToBeOn * self.view.bounds.size.width;
    
    [self.scrollView setAlpha:0.5];
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        NSLog(@"Set the offset of the scrollview: (%f,%f) ",xPosition,0.0);
        [self.scrollView setContentOffset:CGPointMake(xPosition, 0)];
        [self.scrollView setAlpha:1.0];
    } completion:nil];
}

- (void)buttonTapped:(id)sender
{
    NSLog(@"Button tapped");
}

- (void)viewWillLayoutSubviews
{
    [self.scrollView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.selectButton setFrame:CGRectMake(50, 400, 200, 30)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
