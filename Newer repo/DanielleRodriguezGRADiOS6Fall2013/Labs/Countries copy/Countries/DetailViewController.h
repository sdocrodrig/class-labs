//  DetailViewController.h
//  Countries


#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
// This one is defined in .h because root view controller is going to be pushing list of countries down to detail, so needs to access country list
@property(strong, nonatomic)NSMutableArray *countryList;

@end
