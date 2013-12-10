//  MADViewController.h
//  breakfastDependent


#import <UIKit/UIKit.h>
#define breakfastComponent 0
#define restaurantComponent 1

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource >
@property (weak, nonatomic) IBOutlet UIPickerView *breakfastPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;

@property (strong, nonatomic)NSDictionary *breakfastRestaurants;
@property (strong, nonatomic) NSArray *breakfasts;
@property (strong, nonatomic) NSArray *restaurants;

@end
