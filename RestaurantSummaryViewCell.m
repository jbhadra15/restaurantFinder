#import "RestaurantSummaryViewCell.h"
#import "RestaurantDetails.h"

@interface RestaurantSummaryViewCell ()

@property (nonatomic, strong) UIImageView *restImageView;
@property (nonatomic, strong) UIImageView *ratingsImageView;
@property (nonatomic, strong) UILabel *restaurantNameLabel;
@property (nonatomic, strong) UILabel *URLLabel;
@property (nonatomic, strong) UILabel *snippetTextLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *reviewCountLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end


@implementation RestaurantSummaryViewCell

+ (CGFloat)cellHeight
{
    return 100;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

- (void)setRestaurantDetail:(RestaurantDetails *)business
{
    //Restaurant Image View
    NSData *imageData = [NSData dataWithContentsOfURL:business.imageURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    self.restImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.restImageView setImage:image];
    [self.contentView addSubview:self.restImageView];

    //Ratings Image View
    NSData *imageDataRatings = [NSData dataWithContentsOfURL:business.ratingImageURL];
    UIImage *ratingsImage = [[UIImage alloc] initWithData:imageDataRatings];
    self.ratingsImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.ratingsImageView setImage:ratingsImage];
    [self.contentView addSubview:self.ratingsImageView];
    
    //Restaurant Name Label
    self.restaurantNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.restaurantNameLabel.text = business.name;
    [self.restaurantNameLabel setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:self.restaurantNameLabel];
    
    //Address Label
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.addressLabel.text = [NSString stringWithFormat:@"%@, %@", business.streetAddress1, business.city];
    [self.addressLabel setFont:[UIFont systemFontOfSize:10]];
    [self.contentView addSubview:self.addressLabel];
    
    //Website URL
    self.URLLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.URLLabel.text =[NSString stringWithFormat:@"%@",business.businessURL];
    [self.URLLabel setFont:[UIFont systemFontOfSize:8]];
    [self.contentView addSubview:self.URLLabel];

    //Website URL
    self.snippetTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.snippetTextLabel.text = business.snippetText;
    [self.snippetTextLabel setFont:[UIFont systemFontOfSize:7]];
    [self.contentView addSubview:self.snippetTextLabel];
    [self setNeedsLayout];
    
    //Number of Reviews
    self.reviewCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.reviewCountLabel.text =[NSString stringWithFormat:@"%@",business.reviewCount];
    [self.reviewCountLabel setFont:[UIFont systemFontOfSize:8]];
    [self.contentView addSubview:self.reviewCountLabel];
    
    //Phone number Label
    self. phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self. phoneNumberLabel.text =[NSString stringWithFormat:@"%@",business.phoneNumber];
    [self.phoneNumberLabel setFont:[UIFont systemFontOfSize:8]];
    [self.contentView addSubview:self.phoneNumberLabel];
    
    
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectZero];
//    [overlayView setBackgroundColor:[UIColor whiteColor]];
//    [overlayView setAlpha:0.6];
 //   [self.contentView addSubview:overlayView];
  //  self.overlayView = overlayView;
   //
  //  CAGradientLayer *gradient = [CAGradientLayer layer];
   // gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor],(id)[[UIColor blackColor] CGColor], nil];
    //[overlayView.layer addSublayer:gradient];
    //self.gradientLayer = gradient;
    
}

- (void)layoutSubviews
{
    [self.contentView setFrame:CGRectMake(5, 5, 100, self.bounds.size.height-10)];
    
    // Set frame and size of subviews here
    [self.restImageView setFrame:CGRectMake(5, 5, 100, self.bounds.size.height-10)];
    
    [self.restaurantNameLabel setFrame:CGRectMake(115, 5, 200, 15)];
    
    //Adding ratings image view to tableview cell
    [self.ratingsImageView setFrame:CGRectMake(115, 25, 50, 15)];

    [self.reviewCountLabel setFrame:CGRectMake(170, 25, 100, 15)];
    
    [self.addressLabel setFrame:CGRectMake(115, 40, 200, 15)];
    
    [self.phoneNumberLabel setFrame:CGRectMake(115, 50, 200, 15)];

    [self.URLLabel setFrame:CGRectMake(115, 60, 200, 15)];
    
    [self.snippetTextLabel setFrame:CGRectMake(115, 75, 200, 15)];
    
    //[self.overlayView setFrame:CGRectMake(0, 100, self.contentView.bounds.size.width, 100)];
    //[self.gradientLayer setFrame:CGRectMake(0, 100, self.contentView.bounds.size.width, 100)];
    
}


@end
