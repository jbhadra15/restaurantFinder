//
//  ViewController.m
//  APITest
//
//  Created by Jen Patten on 2/8/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"
#import "DetailRestaurantViewController.h"
#import "RestaurantDetails.h"
#import "RestaurantSummaryViewCell.h"
#import "SearchFormViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *results;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tableView];
    
    // Register the RestaurantSummaryViewCell for the "summaryView" reuse-identifier
    [tableView registerClass:[RestaurantSummaryViewCell class] forCellReuseIdentifier:@"summaryView"];
    
    NSString *term = self.restaurantText;
    NSString *location = self.locationText;
        
    [APIManager resultForSearchTerm:term  location:location completionHandler:^(NSArray *restaurantDetails, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            self.results = restaurantDetails;
            [tableView reloadData];
        });
    }];
}

-(void)setSearchTerms:(NSString *) restaurantType location:(NSString *)locationDetails {
    self.locationText = locationDetails;
    self.restaurantText = restaurantType;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row tapped %ld", (long)indexPath.row);
    DetailRestaurantViewController *detailVC = [[DetailRestaurantViewController alloc] init];
    
    //    NSDictionary *businesDetails = self.results[indexPath.row];
    //    detailVC.businessDetails = businesDetails;
    RestaurantDetails *detail = self.results[indexPath.row];
    detailVC.restaurantDetails = detail;
  
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"summaryView"];
    RestaurantDetails *modelObject = self.results[indexPath.row];
    [self.cell setRestaurantDetail:modelObject];
    return self.cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RestaurantSummaryViewCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RestaurantSummaryViewCell cellHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
