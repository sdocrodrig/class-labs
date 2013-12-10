//
//  MADViewController.h
//  Lab3_outofclass
//
//  Created by new user on 9/19/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIImageView *sportImage;
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;


@end
