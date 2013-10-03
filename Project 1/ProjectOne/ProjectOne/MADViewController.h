//
//  MADViewController.h
//  ProjectOne
//

#import <UIKit/UIKit.h>

#define kOrgComponent 0
#define kApptComponent 1

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *dependentPicker;
@property (strong, nonatomic) NSDictionary *apptOrgs;
@property (strong, nonatomic) NSArray *apptTypes;
@property (strong, nonatomic) NSArray *orgTypes;
-(IBAction) buttonPressed;
@property (weak, nonatomic) IBOutlet UIImageView *docViewer;
- (IBAction)revealDoc:(UIButton *)sender;

@end
