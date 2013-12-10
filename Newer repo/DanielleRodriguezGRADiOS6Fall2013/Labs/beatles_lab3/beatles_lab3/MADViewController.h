//
//  MADViewController.h
//  beatles_lab3
//
//  Created by new user on 9/17/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
// in parenthese is return type - going to return to UISegmentedControl
- (IBAction)changeImage:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *capitalizedSwitch;
- (IBAction)updateFont:(UISwitch *)sender;

- (IBAction)changeFontSize:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeNumberLabel;

@end
