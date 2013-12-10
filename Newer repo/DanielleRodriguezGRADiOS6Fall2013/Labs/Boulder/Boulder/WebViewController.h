
//  WebViewController.h
//  Boulder


#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate> // delegate protocol lets know when should start and stop spinner
@property (weak, nonatomic) IBOutlet UIWebView *boulderWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *boulderSpinner;
@end
