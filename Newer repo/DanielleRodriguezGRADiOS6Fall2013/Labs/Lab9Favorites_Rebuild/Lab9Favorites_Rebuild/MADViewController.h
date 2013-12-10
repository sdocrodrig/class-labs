//  MADViewController.h
//  Lab9Favorites_Rebuild


#import <UIKit/UIKit.h>
#import "Model.h"

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *helloName;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *birthCity;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *bestQuality;
@property (strong, nonatomic)Model *user;
@end
