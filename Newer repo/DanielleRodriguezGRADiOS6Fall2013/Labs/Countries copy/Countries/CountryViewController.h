//
//  CountryViewController.h
//  Countries
//
//  Created by Danielle Rodriguez on 10/29/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import <UIKit/UIKit.h>
//making an array
#import "DetailViewController.h"

@interface CountryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
//making an array
@property (copy, nonatomic) NSString *addedCountry;

@end
