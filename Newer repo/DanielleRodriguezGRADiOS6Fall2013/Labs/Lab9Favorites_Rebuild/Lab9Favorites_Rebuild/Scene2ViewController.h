
//  Scene2ViewController.h
//  Lab9Favorites_Rebuild


#import <UIKit/UIKit.h>
#import "Model.h"

@interface Scene2ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userBirthday;
@property (weak, nonatomic) IBOutlet UITextField *userCity;
@property (weak, nonatomic) IBOutlet UITextField *userJob;
@property (weak, nonatomic) IBOutlet UITextView *userTrait;

@property(strong, nonatomic)Model *userInfo;
@end
