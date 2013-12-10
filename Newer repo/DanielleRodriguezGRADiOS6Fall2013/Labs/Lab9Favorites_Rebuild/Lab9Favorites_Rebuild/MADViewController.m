//  MADViewController.m
//  Lab9Favorites_Rebuild


#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _user=[[Model alloc]init]; // allocates memory and initiales the user object
}

-(void)viewWillAppear:(BOOL)animated{
    _helloName.text=_user.name;
    _birthday.text=_user.birth;
    _birthCity.text=_user.city;
    _job.text=_user.workplace;
    _bestQuality.text=_user.like;
    
}

-(IBAction)returned:(UIStoryboardSegue *)segue {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
