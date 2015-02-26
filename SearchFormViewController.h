//
//  SearchFormViewController.h
//  APITest
//
//  Created by Jen Patten on 2/17/15.
//  Copyright (c) 2015 Jen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SearchFormViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    UIPickerView *pickerView;
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) UITextField *restaurantTextField;
@property (nonatomic, strong) UITextField *locationTextField;
@property (nonatomic, strong) NSString *restaurantText;
@property (nonatomic, strong) NSString *locationText;
@property (nonatomic, strong) UILabel *restaurantTypeLabel;

@end
