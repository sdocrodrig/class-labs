
//  WebViewController.m
//  Boulder


#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString{
    //The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized ising a NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [_boulderWebView loadRequest: request]; //loads a NSURLRequest object
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _boulderWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_boulderSpinner startAnimating];
    //sends the startAnimating message to the spinner
}

//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating]; //sends the stopAnimating message to the spinner
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
