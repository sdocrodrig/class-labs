//
//  MADViewController.m
//  tipCalculator_OutOfClass
//
//  Created by new user on 9/24/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_billAmount.delegate=self;
    _modifiedTip.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)changeNumberPeople:(UISlider *)sender {
    // get the number of people
    int numberPeople = sender.value;
    // change number of people label
    _totalPeople.text=[NSString stringWithFormat:@"%i", numberPeople];
    
}

- (IBAction)calculateTip:(UIButton *)sender {
    
    float amount=[_billAmount.text floatValue];
    int numberPeople=[_totalPeople.text intValue];
    float pct=[_modifiedTip.text floatValue];
    
    pct=pct/100;
    float tip=amount*pct;
    float total=amount+tip;
    float personTotal= 0;
    if (numberPeople>0)
    {
        personTotal=total/numberPeople;
    }
    NSNumberFormatter *currencyFormatter=[[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    _totalPerPerson.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:personTotal]];
    if (_tipControl.selectedSegmentIndex==3){
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Recommend this restaurant"
                                                          message:@"Would you like to enter a review for this restaurant?"
                                                         delegate: self
                                                cancelButtonTitle:@"No thanks"
                                                otherButtonTitles:@"Sure!", nil];
        [alertView show];
    }
}


- (IBAction)gradeService:(UISegmentedControl *)sender {

    // Get values from text fields
     if (_tipControl.selectedSegmentIndex==0){
        
         int pct=5;
         _modifiedTip.text=[NSString stringWithFormat:@"%d", pct];
 
     } else if (_tipControl.selectedSegmentIndex==1){
         int pct=10;
         _modifiedTip.text=[NSString stringWithFormat:@"%d", pct];

    } else if (_tipControl.selectedSegmentIndex==2){
        int pct=15;
        _modifiedTip.text=[NSString stringWithFormat:@"%d", pct];
    
     } else if (_tipControl.selectedSegmentIndex==3){
         int pct=20;
         _modifiedTip.text=[NSString stringWithFormat:@"%d", pct];
    
     }

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    [textField clearsOnBeginEditing];
    return YES;
}


@end
