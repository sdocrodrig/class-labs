//  MADViewController.m
//  SinglePicker

// Tutorial followed @ http://www.techotopia.com/index.php/An_iOS_6_iPhone_UIPickerView_Example


#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Arrays need to be initialized when the application loads, so add to viewDidLoad method
    _countryNames = @[@"Australia (AUD)", @"China (CNY)", @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    _exchangeRates = @[ @0.9922f, @6.5938f, @0.7270f, @0.6206f, @81.57f];
}

#pragma mark -
#pragma mark PickerView DataSource
//At minimum, class designated as the data source must implement the following methods....
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
// Called by the PickerView to identify the number of components (i.E. selection wheels) that are to be displayed to the user.
{
    return 1;
// Method returns a value of 1 since picker only has one component.
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
// Informs the PickerView of the number of rows (in other words the selection options) that are present in a specified component.
{
    return _countryNames.count;
// Method returns the number of rows in the component by counting the number of elements in the country name array.
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
// Called by the PickerView to identify the string that is to be displayed for a specified row in a specific component. 
{
    return _countryNames[row];
// Method returns the corresponding country name for the requested row by using the row number as a reference into the country names array.
}

#pragma mark -
#pragma mark PickerView Delegate
// The only delegate method needed is the one that gets called when the user makes a selection from the PickerView component.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    float rate = [_exchangeRates[row] floatValue];
    // Method takes akes the selected row number argument and uses it as an index to obtain the exchange rate from the exchangeRates array
    float dollars = [_dollarText.text floatValue];
    // The dollar amount entered by the user is converted from a string to a floating point number...
    float result = dollars * rate;
    // ...and multiplied by the US Dollar amount to arrive at a conversion value. 
    
    NSString *resultString = [[NSString alloc] initWithFormat: @"%.2f USD = %.2f %@", dollars, result, _countryNames[row]];
    // A string is constructed from the dollar amount, the converted amount and the country name.
    _resultLabel.text = resultString;
    
    // The string is then displayed on the label and the string is released.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)textFieldReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    // Keyboard hides when user touches the Return key. 
}
@end
