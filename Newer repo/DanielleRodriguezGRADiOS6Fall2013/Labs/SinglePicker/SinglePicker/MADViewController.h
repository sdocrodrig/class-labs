//  MADViewController.h
//  SinglePicker


#import <UIKit/UIKit.h>
// View controller is declared as implementing both the UIPickerViewDelegate and UIPickerViewDataSource
        // In order to obtain the options to be displayed to the user, the PickerView needs a data source. This data source takes the form of a protocol that defines the methods that must be implemented in order to provide the Picker with data information.
@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
// Two arrays are needed to store the country names and corresponding exchange rates
@property (strong, nonatomic) NSArray *countryNames;
@property (strong, nonatomic) NSArray *exchangeRates;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *dollarText;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)textFieldReturn:(UITextField *)sender;
@end
