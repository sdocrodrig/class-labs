//
//  MADViewController.m
//  Pace Setter 2013 _ Lab 2
//
//  Created by new user on 9/11/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // if NSNumber is needed
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)bpmReadPressed:(UIButton *)sender {

    _promptLabel.text = [NSString stringWithFormat:@"Guess you're average run mile pace"];
    _bpmRead.text = [NSString stringWithFormat:@"0.0"];

    
}


- (IBAction)modificationPressed:(UIButton *)sender {
}
@end
