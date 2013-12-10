//
//  MADViewController.h
//  HelloWorld2-13
//
//  Created by new user on 9/3/13.
//  Copyright (c) 2013 sdocrodrig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController //subclass syntax - MADViewController is subclass of UIViewController superclass
@property (retain, nonatomic) IBOutlet UILabel *messageText;

- (IBAction)buttonPressed:(UIButton *)sender;
// As UIButton id, only object of UIButton class can call upon. Method ButtonPressed called by UIButton and causes action.



@end
