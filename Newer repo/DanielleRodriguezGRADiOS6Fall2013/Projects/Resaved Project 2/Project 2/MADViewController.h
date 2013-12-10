//  MADViewController.h
//  Project 2


#import <UIKit/UIKit.h>
#import "docViewController.h"
#import "ModelData.h"
#import "docViewController.h"



@interface MADViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(strong, nonatomic)ModelData *userInput;


- (IBAction)takePicture:(UIBarButtonItem *)sender;


- (IBAction)person:(UITextField *)sender;
@property (strong, nonatomic) IBOutlet UITextField *personOut;

- (IBAction)phoneNo:(UITextField *)sender;
@property (strong, nonatomic) IBOutlet UITextField *phoneNoOut;

- (IBAction)streetName:(UITextField *)sender;
@property (strong, nonatomic) IBOutlet UITextField *streetNameOut;

@property (strong, nonatomic) IBOutlet UIImageView *organizationEmblem;

@property (strong, nonatomic) IBOutlet UILabel *organizationQuestion;

@property (strong, nonatomic) IBOutlet UILabel *labelToPass;


@property (strong, nonatomic) IBOutlet UIButton *hiddenSocialSecurityButton;
@property (strong, nonatomic) IBOutlet UIButton *hiddenDWSButton;
@property (strong, nonatomic) IBOutlet UIButton *hiddenDHSButton;
@property (strong, nonatomic) IBOutlet UIButton *hiddenDHHSButton;
@property (strong, nonatomic) IBOutlet UIButton *hiddenRedwoodButton;

@end
