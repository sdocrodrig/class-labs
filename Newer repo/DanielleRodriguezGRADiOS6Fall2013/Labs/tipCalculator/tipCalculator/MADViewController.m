//
//  MADViewController.m
//  tipCalculator
//
//  Created by new user on 9/19/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_checkAmount.delegate=self;
    _tipPercent.delegate=self;
    _people.delegate=self;
    // Do any additional setup after loading the view, typically from a nib
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTipTotals
{
    //get the values from text fields
    //floatValue returns a float, intValue returns an int
    float amount=[_checkAmount.text floatValue];
    float pct=[_tipPercent.text floatValue];
    int numberOfPeople=[_people.text intValue];
    
    pct=pct/100; //Convert to a fraction
    //compute the totals
    float tip=amount*pct;
    float total=amount+tip;
    float personTotal=0;
    
    //handles divide by 0 error
    if (numberOfPeople>0)
    {
        personTotal=total/numberOfPeople;
    }
    else { //an alert will show if numberOfPeople is 0
      //alloc init call to create alertView object
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Warning"
                                                         message: @"The number of people must be greater than 0"
                                                        delegate: self
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:@"OK", nil]; // list will always end in nil
        [alertView show]; // send show message to show up
    }
    
    //use NSNumberFormatter to set the format style to currency
    NSNumberFormatter *currencyFormatter=[[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //update the labels
    //stringFromNumber: generates strings
    _tipDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:tip]];
    _totalDue.text=[currencyFormatter stringFromNumber: [NSNumber numberWithFloat:total]];
    _totalDuePerPerson.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat: personTotal]];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) // OK button
    {
        _people.text=[NSString stringWithFormat:@"1"];
        [self updateTipTotals]; // good idea to put in separate method so can call different times, like now
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self updateTipTotals];
}

@end
