//
//  MADViewController.h
//  AnimationsLab
//
//  Created by Danielle Rodriguez on 11/14/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)sliderMoved:(UISlider *)sender;

@end
