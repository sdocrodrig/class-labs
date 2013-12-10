//
//  MADViewController.h
//  tipCalculator_OutOfClass
//
//  Created by new user on 9/24/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalPeople;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPerson;
@property (weak, nonatomic) IBOutlet UITextField *modifiedTip;
@property (weak, nonatomic) IBOutlet UILabel *TipDetermined;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)gradeService:(UISegmentedControl *)sender;

- (IBAction)changeNumberPeople:(UISlider *)sender;

- (IBAction)calculateTip:(UIButton *)sender;

- (IBAction)resetPressed:(UIButton *)sender;

@end
;