//
//  MADViewController.m
//  beatles_lab3
//
//  Created by new user on 9/17/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    
    _imageControl.selectedSegmentIndex=-1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateImage{
    //if/else statement if segment index 0 is chosen, change image to be beatles_early 60s image and change text to be young image, else if segment index 1 is chosen... etc.
    if (_imageControl.selectedSegmentIndex==0) {
        _titleLabel.text=@"Young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles_early60s.png"];
    }
    else if (_imageControl.selectedSegmentIndex==1) {
        _titleLabel.text=@"Not as young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles_late60s.png"];
    }
}

-(void)updateCaps{
    // can use == YES or .on
    //if boolean value don't need else if (?)
    // when call a method, whatever it returns is assigned to whatever is on the left hand side of the equal sign
    if (_capitalizedSwitch.on) {
        _titleLabel.text=[_titleLabel.text uppercaseString];
    }
    else {
        _titleLabel.text=[_titleLabel.text lowercaseString];
    }
    
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];

}

- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];

}
// accessible through sender (parameter)
- (IBAction)changeFontSize:(UISlider *)sender {
    // get the font size
//    int fontSize = sender.value;
    // change the font size label
//    _fontSizeNumberLabel.text=[NSString stringWithFormat:@"%d", fontSize];
    //create a new font object, allocate and initialize object to whatever value move slider to.
//    UIFont *newFont = [UIFont systemFontOfSize:sender.value];
    //Font property is expecting a UIFont object, which is what was created line above
    //apply the new font to the label
//    _titleLabel.font=newFont;
    
//Shortcut solution
    _fontSizeNumberLabel.text=[NSString stringWithFormat:@"%f", sender.value];
    _titleLabel.font=[UIFont systemFontOfSize:sender.value];
    
}

@end
