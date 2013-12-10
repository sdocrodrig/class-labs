//
//  MADViewController.m
//  HelloWorld2-13
//
//  Created by new user on 9/3/13.
//  Copyright (c) 2013 sdocrodrig. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

// Icon pulled from http://www.damioluwatoyinbo.com/personal-transformation/how-to-change-the-world/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_messageText release];
    [_messageText release];
    [super dealloc];
}


- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    _messageText.text=[NSString stringWithFormat:@"%@ World", title];
}
@end
