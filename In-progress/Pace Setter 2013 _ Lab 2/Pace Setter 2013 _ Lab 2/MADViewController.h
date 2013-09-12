//
//  MADViewController.h
//  Pace Setter 2013 _ Lab 2
//
//  Created by new user on 9/11/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (nonatomic, copy)NSString *operation;// add a minute or subtract a minute
@property (nonatomic) int minuteLess;
@property (nonatomic) int minuteMore;
@property (weak, nonatomic) IBOutlet UILabel *milePace;
- (IBAction)bpmReadPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *bpmRead;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
- (IBAction)modificationPressed:(UIButton *)sender;


@end
