
//  MADSecondViewController.m
//  Boulder

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)submitQuestion:(UIButton *)sender {
    //dismimesses the keyboard by using resignFirstResponder regardless of which field is the first responder
    //http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to :nil from: nil forEvent:nil];
    //mailto syntax: mailto:first@example.com?
    //Mailto parameter should by preceded by "?" for the first or only parameter and "&" for the second and subsequent parameter
    NSString *recipients = @"mailto:sdrodrig@colorado.edu?subject=Question from Boulder app";
    NSString *body = [NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextView.text, _nameTextField.text, _questionTextView .text];
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    NSLog(email);
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //returns a legal URL string
    //opens the mail app
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
@end
