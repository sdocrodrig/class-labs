//  MADViewController.m
//  breakfastDependent


#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad]; //
	// Only time loads is when goes from inactive, into foreground and active
    //First: Use NSBundle Class
    NSBundle *bundle = [NSBundle mainBundle];
    // Have bundle object point to file in operating system. On bundle object, call method pathForResource, it returns full path name in string which assign to NSString object plistPath
    NSString *plistPath=[bundle pathForResource:@"breakfastrestaurant" ofType:@"plist"];
    // In book NSURL *plistURL = [bundle URLForResource:@"brekfastrestaurant" ofType:@"plist"];
   
    _breakfastRestaurants=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    // In book self.breakfastRestaurants=[NSDictionary dictionaryWithContentsOfURL:plistURL];

    _breakfasts=[_breakfastRestaurants allKeys];
    //In book NSArray *allOrgs = [self.breakfastRestaurants allKeys];
    
    NSString *selectedBreakfast=[_breakfasts objectAtIndex: 0];
    _restaurants=[_breakfastRestaurants objectForKey:selectedBreakfast];
}

//Required for the UIPickerViewDataSource protocol
-(NSInteger)pickerView:(UIPickerView *)pickerView {
    return 2; // number of components
}

//Required for the UIPickerViewDataSource protocol
-(NSInteger)pickerView: (UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger) component{
    if (component==breakfastComponent)//checks which component was picked and returns that components row count
        return [_breakfasts count];
    else return[_restaurants count];
}

// In delegate method check which component was picked before we can return the value.
-(NSString *)pickerView:(UIPickerView *)pickerView
titleForRow:(NSInteger) row
           forComponent:(NSInteger) component{
    if (component==0) //checks which component was picked and returns the value for the requested component.
        return [_breakfasts objectAtIndex:row];
    else return [_restaurants objectAtIndex:row];
}

//Use both components when printing results
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if(component==breakfastComponent){
        //checks which component was picked
        NSString *selectedBreakfast=[_breakfasts objectAtIndex:row]; // gets the selected breakfast
        _restaurants=[_breakfastRestaurants objectForKey:selectedBreakfast]; // Gets the restaurants for the selected breakfasts and assigns the array of restaurants to the right component.
                      [_breakfastPicker selectRow:0 inComponent: restaurantComponent animated:YES]; //set the right component back to 0
                      [_breakfastPicker reloadComponent:restaurantComponent]; //reload the right component
                      }
                      NSInteger breakfastsrow=[_breakfastPicker selectedRowInComponent:breakfastComponent];
                      // gets the chosen row for breakfast
                      NSInteger restaurantsrow=[_breakfastPicker selectedRowInComponent:restaurantComponent];
                      // gets the chosen row for restaurant
                      _choiceLabel.text=[NSString stringWithFormat:@"You can get great %@ at %@", [_restaurants objectAtIndex:restaurantsrow], [_breakfasts objectAtIndex:breakfastsrow]];
                      //writes the string with selected rows content to the label.
        
    }
    
#pragma mark - 
#pragma mark 2 Component picker
    //NSInteger breakfastrow=[_breakfastPicker selectedRowInComponent:0];
    //gets the chosen row for type of breakfast
    //NSInteger restaurantrow=[_breakfastPicker selectedRowInComponent: 1];
    // gets the chosen row for the restaurant
    // writes the string with the selected row's content to the label
    
   // _choiceLabel.text=[NSString stringWithFormat:@"You can get %@ from %@ in Boulder", [_breakfasts objectAtIndex:breakfastrow],
     //                 [_restaurants objectAtIndex:restaurantrow]];

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Optional to change width of components
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component==restaurantComponent)
        return 250;
    else return 230;
}

// optional to change the height of each picker row
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 33;
}

@end
