//  Scene2ViewController.m
//  Lab9Favorites_Rebuild


#import "Scene2ViewController.h"
#import "Model.h"
#import "MADViewController.h"

@interface Scene2ViewController ()

@end

@implementation Scene2ViewController

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
    _userInfo=[[Model alloc]init];
    _userName.delegate=self;
    _userBirthday.delegate=self;
    _userCity.delegate=self;
    _userJob.delegate=self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"donePersonalizing"]) {
        _userInfo.name=_userName.text;
        _userInfo.birth=_userBirthday.text;
        _userInfo.city=_userCity.text;
        _userInfo.workplace=_userJob.text;
        _userInfo.like=_userTrait.text;
        //creating an object for our destinationViewController so we can send the data back
        MADViewController *scene1ViewController=[segue destinationViewController];
        scene1ViewController.user.name=_userInfo.name;
        scene1ViewController.user.birth=_userInfo.birth;
        scene1ViewController.user.city=_userInfo.city;
        scene1ViewController.user.workplace=_userInfo.workplace;
        scene1ViewController.user.like=_userInfo.like;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
