//
//  MADViewController.m
//  Lab3_outofclass
//
//  Created by new user on 9/19/13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
if(sender.tag==1)
{
    //__________ put in image file name
    _sportImage.image=[UIImage imageNamed:@"MLB.png"];
    NSString *message= [[NSString alloc] initWithFormat:@"%@, you're patriotic, patient, statistically minded and superstitious", _nameField.text];
    _messageLabel.text=message;
}
if(sender.tag==2)
{
    _sportImage.image=[UIImage imageNamed:@"nba_logo.png"];
    NSString *message= [[NSString alloc] initWithFormat:@"You're competitive and energetic, %@", _nameField.text];
    _messageLabel.text=message;
}
if(sender.tag==3)
{
     _sportImage.image=[UIImage imageNamed:@"NFL.png"];
    NSString *message= [[NSString alloc] initWithFormat:@"You value a sense of team and like to veg, %@", _nameField.text];
    _messageLabel.text=message;
}
if(sender.tag==4)
{
    _sportImage.image=[UIImage imageNamed:@"PGA.png"];
    NSString *message= [[NSString alloc] initWithFormat:@"%@, you're patient...with a steady income!", _nameField.text];
    _messageLabel.text=message;
}
if(sender.tag==5)
{
    _sportImage.image=[UIImage imageNamed:@"MLS.png"];
        NSString *message= [[NSString alloc] initWithFormat:@"You're a good team pleayer and travel well, %@", _nameField.text];
    _messageLabel.text=message;
}

}
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
