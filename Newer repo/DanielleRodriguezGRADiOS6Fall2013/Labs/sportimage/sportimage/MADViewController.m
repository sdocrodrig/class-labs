//
//  MADViewController.m
//  sportimage
//
//  Created by new user on 9/10/13.
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

- (IBAction)buttonPressed:(UIButton *)sender { // button calling method is named sender
    if(sender.tag==1)
    {
        _SportImage.image=[UIImage imageNamed:@"rockies_logo.png"]; //instance names in .m accessible with _
        // have to create image object. [ ] you are calling a method, UIImage class has method imageNamed. We pass file name of image file, that method returns UIImage object that can assign to property _SportImage
        // UIImage - The image displayed in the image view. The initial value of this property is the image passed into the initWithImage: method or nil if you initialized the receiver using a different method. If the animationImages property contains a value other than nil, the contents of this property are not used. Setting the image property does not change the size of a UIImageView. Call sizeToFit to adjust the size of the view to match the image.
        NSString *message = [[NSString alloc] initWithFormat:@"%@, take me out to the ballgame", _nameField.text];
        // % is placebolder for what going to pass in, a string (comma) what passing in is from nameField
        _messageLabel.text=message;
        // creating object instance named message of NSString and going to assign to message line of label.
       _messageLabel.textColor=[UIColor purpleColor];
        self.view.backgroundColor = [UIColor blackColor];
    // change font of Who's there? to purple
    // change font of "what's your favorite Denver team?" to purple
        

    
    }
    if(sender.tag==2)
    {
        _SportImage.image=[UIImage imageNamed:@"broncos_logo.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"Manning on Manning last game, %@, sibling rivalry", _nameField.text];
        _messageLabel.text=message;
        
        _messageLabel.textColor=[UIColor whiteColor];
        self.view.backgroundColor = [UIColor orangeColor];
    }
    
}
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
