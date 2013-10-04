//
//  MADViewController.h
//  browser
//
//  Created by new user on 9/24/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIWebViewDelegate, UIActionSheetDelegate>
//When do you know when you need a delegate?
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
