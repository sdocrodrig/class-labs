//
//  CountryViewController.m
//  Countries
//
//  Created by Danielle Rodriguez on 10/29/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

//method automatically called when view controller about to segue and transition to another view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"doneSegue"]) {
        _addedCountry=_countryTextField.text;
        if (_countryTextField.text.length>0) {
            _addedCountry=_countryTextField.text;
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
