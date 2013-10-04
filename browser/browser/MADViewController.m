//
//  MADViewController.m
//  browser
//
//  Created by new user on 9/24/13.
//  Copyright (c) 2013 ATLS. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView.delegate=self; //AP: self is always current thing running it (MADViewController class)
    //sets the controller as the delegate of the UIWebView instance
    // This is third step in delegate process
    [self loadWebPageWithString:@"http://facebook.com"];
    //AP: calling loadWebPageWithStrong method and calling a string


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//load a new web page in the web view
-(void)loadWebPageWithString: (NSString *)urlString
//AP: (-) its an instance method, return type void, parameter is NSString object, parameter name is urlString, method loadWebPageWithString
//The NSString passed should be a properly formed URL
{
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString that is passed to the method
    // AP: Creating an object of url of class NSURL, for this class can alloc and init in one shot by calling class method URLWithString on urlString (took as an argument)
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    //AP: create NSURL request object, alloc and init with requestWithURL: class method on NSURLRequest class, takes url class just created as an argument
    [_webView loadRequest:request]; //loads a NSURLRequest object
    //AP: instance variable - loadRequest takes NSURL request object that is a request
}

//UIWebViewDelegate method called when the web page doesn't load successfully
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error loading web page"
                                                      message: [error localizedDescription] //NSError translates error messages into the user's language
                                                     delegate:self
                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK", nil];
    [alertView show]; // send the show message to display the alertView
}

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    // creates the action sheet
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"ATLAS", @"TAM", @"CU", nil]; // creates an array, nil at end says that this is end of array
    [actionSheet showFromToolbar:_toolbar];
    //displays the action sheet from the toolbar
}

//Delegate handles when user taps on the button
//UIActionSheetDelegate Method
//called when a selection is made on an action sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
    [self loadWebPageWithString:@"http://atlas.colorado.edu"];
}
else if(buttonIndex==1)
    {
        [self loadWebPageWithString:@"http://tam.colorado.edu"];
    }
    else if(buttonIndex==2)
        {
            [self loadWebPageWithString:@"http://www.colorado.edu"];
        }
}
//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_spinner startAnimating]; //sends the startAnimating message to the spinner
}
//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_spinner stopAnimating]; //sends the stopAnimating message to the spinner
}

@end
