//
//  MADViewController.m
//  Lab1HelloWorldRebuild
//
//  Created by new user on 9/5/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

// Icon images pulled from http://www.damioluwatoyinbo.com/personal-transformation/how-to-change-the-world/

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

- (IBAction)sayHelloButton:(UIButton *)sender {
    
    _messageText.text=@"Hello World!";
    
}
@end
