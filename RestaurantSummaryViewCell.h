
#import <UIKit/UIKit.h>
@class RestaurantDetails;

@interface RestaurantSummaryViewCell : UITableViewCell

+ (CGFloat)cellHeight;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setRestaurantDetail:(RestaurantDetails *)restaurantDetails;

@end
