//
//  MADViewController.h
//  sportimage
//
//  Created by new user on 9/10/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h> //import frameworks in < >

@interface MADViewController : UIViewController // Colon says subclass of UIViewController
//  The UIViewController class provides the fundamental view-management model for all iOS apps. You rarely instantiate UIViewController objects directly. Instead, you instantiate subclasses of the UIViewController class based on the specific task each subclass performs. A view controller manages a set of views that make up a portion of your app’s user interface. As part of the controller layer of your app, a view controller coordinates its efforts with model objects and other controller objects—including other view controllers—so your app presents a single coherent user interface.
- (IBAction)buttonPressed:(UIButton *)sender; // buttonPressed is an action, a method
//  An instance of the UIButton class implements a button on the touch screen. A button intercepts touch events and sends an action message to a target object when tapped. Methods for setting the target and action are inherited from UIControl. This class provides methods for setting the title, image, and other appearance properties of a button. By using these accessors, you can specify a different appearance for each button state.
@property (weak, nonatomic) IBOutlet UIImageView *SportImage; //SportImage is instance variable
//  An image view object provides a view-based container for displaying either a single image or for animating a series of images. For animating the images, the UIImageView class provides controls to set the duration and frequency of the animation. You can also start and stop the animation freely.
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
