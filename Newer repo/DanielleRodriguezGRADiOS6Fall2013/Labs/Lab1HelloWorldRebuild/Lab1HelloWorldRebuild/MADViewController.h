//
//  MADViewController.h
//  Lab1HelloWorldRebuild
//
//  Created by new user on 9/5/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageText;
- (IBAction)sayHelloButton:(UIButton *)sender;

@end
