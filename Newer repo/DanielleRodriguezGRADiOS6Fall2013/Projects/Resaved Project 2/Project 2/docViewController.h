//  docViewController.h
//  Project 2


#import <UIKit/UIKit.h>
#import "MADViewController.h"
#import "ModelData.h"

@interface docViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)selectPhoto:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *i94;
@property (strong, nonatomic) IBOutlet UILabel *socialSecurityCard;
@property (strong, nonatomic) IBOutlet UILabel *addressedMail;
@property (strong, nonatomic) IBOutlet UILabel *stateID;
@property (strong, nonatomic) IBOutlet UILabel *medicareCard;
@property (strong, nonatomic) IBOutlet UILabel *EIN;
@property (strong, nonatomic) IBOutlet UILabel *busPass;

@property (strong, nonatomic) NSString *labelText;
@property (strong, nonatomic) IBOutlet UIImageView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *passedLabel;
@property (strong, nonatomic) NSString *passedText;

@end
