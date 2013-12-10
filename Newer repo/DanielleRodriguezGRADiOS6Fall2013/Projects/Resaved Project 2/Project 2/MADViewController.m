//  MADViewController.m
//  Project 2


#import "MADViewController.h"

@interface MADViewController ()
@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView  show];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
    
    _userInput=[[ModelData alloc]init];
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    [self.personOut resignFirstResponder];
    [self.phoneNoOut resignFirstResponder];
    [self.streetNameOut resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    docViewController *transferViewController = segue.destinationViewController;
    NSLog(@"prepareForSegue: %@", segue.identifier);
          if([segue.identifier isEqualToString:@"SSA"])
          {
              transferViewController.passedText=@"Social Security Administration";
          }
          else if ([segue.identifier isEqualToString:@"DWS"])
          {
              transferViewController.passedText=@"Department of Workforce Services";
          
          }
          else if ([segue.identifier isEqualToString:@"DHS"])
          {
              transferViewController.passedText=@"TB Clinic";
            
          }
          else if ([segue.identifier isEqualToString:@"DHHS"])
          {
              transferViewController.passedText=@"Department of Health and Human Services";
          }
          else if ([segue.identifier isEqualToString:@"Redwood"])
          {
              transferViewController.passedText=@"Redwood Health Clinic";
              
          }
}
-(IBAction)unwindToMAD:(UIStoryboardSegue *)unwindSegue {
    _streetNameOut.text=nil;
    _phoneNoOut.text=nil;
    _personOut.text=nil;
    _organizationEmblem.image=nil;
    _organizationQuestion.text=nil;
    _labelToPass.text=nil;
    self.hiddenSocialSecurityButton.hidden=YES;
    self.hiddenDWSButton.hidden=YES;
    self.hiddenDHSButton.hidden=YES;
    self.hiddenDHHSButton.hidden=YES;
    self.hiddenRedwoodButton.hidden=YES;
}



- (IBAction)takePicture:(UIBarButtonItem *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (IBAction)person:(UITextField *)sender {
    NSString *personInput=_personOut.text;
    personInput=[personInput lowercaseString];
    if([personInput rangeOfString:@"kristian falls"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Social Security Administration"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"socialSecurityEmblem.png"];
        _labelToPass.text=title;
        self.hiddenSocialSecurityButton.hidden=NO;
        
    }
    if([personInput rangeOfString:@"ta rau"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the TB Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"DepartmentOfHealthEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDHSButton.hidden=NO;
    }
    if([personInput rangeOfString:@"jeff combe"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Workforce Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"dwsEmblem.png"];
          _labelToPass.text=title;
        self.hiddenDWSButton.hidden=NO;

    }
    if([personInput rangeOfString:@"ian bush"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
         NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Health and Human Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"MedicaidEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDHHSButton.hidden=NO;

    }
    if([personInput rangeOfString:@"doctor"].location !=NSNotFound|| [personInput rangeOfString:@"dr."].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
             NSString *title = [[NSString alloc] initWithFormat:@"@ at the Redwood Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"UHealthCareEmblem.png"];
        _labelToPass.text=title;
        self.hiddenRedwoodButton.hidden=NO;


    }
}
- (IBAction)phoneNo:(UITextField *)sender {
    NSString *phoneNoInput=_phoneNoOut.text;
    if([phoneNoInput rangeOfString:@"8015260950"].location !=NSNotFound|| [phoneNoInput rangeOfString:@"801-526-0950"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
            NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Workforce Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"dwsEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDWSButton.hidden=NO;

    }
    if([phoneNoInput rangeOfString:@"8016295482"].location !=NSNotFound|| [phoneNoInput rangeOfString:@"801-629-5482"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click proceed"];
            NSString *title = [[NSString alloc] initWithFormat:@"@ the Redwood Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"UHealthCareEmblem.png"];
        _labelToPass.text=title;
        self.hiddenRedwoodButton.hidden=NO;

    }
    if([phoneNoInput rangeOfString:@"8013231174"].location !=NSNotFound|| [phoneNoInput rangeOfString:@"801-323-1174"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the TB Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"DepartmentOfHealthEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDHSButton.hidden=NO;
    }
    if([phoneNoInput rangeOfString:@"8019132262"].location !=NSNotFound|| [phoneNoInput rangeOfString:@"801-913-2262"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Health and Human Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"Medicaid.png"];
        _labelToPass.text=title;
        self.hiddenDHHSButton.hidden=NO;
    }
    if([phoneNoInput rangeOfString:@"8015411721"].location !=NSNotFound|| [phoneNoInput rangeOfString:@"801-541-1721"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Social Security Administration"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"socialSecurityEmblem.png"];
        _labelToPass.text=title;
        self.hiddenSocialSecurityButton.hidden=NO;

    }
}
- (IBAction)streetName:(UITextField *)sender {
    NSString *streetnameInput=_streetNameOut.text;
    streetnameInput=[streetnameInput lowercaseString];
    if([streetnameInput rangeOfString:@"leston parkway"].location !=NSNotFound||[streetnameInput rangeOfString:@"leston prkwy"].location !=NSNotFound||[streetnameInput rangeOfString:@"leston"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Social Security Administration"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"socialSecurityEmblem.png"];
        _labelToPass.text=title;
        self.hiddenSocialSecurityButton.hidden=NO;

    }
    if([streetnameInput rangeOfString:@"colton drive"].location !=NSNotFound||[streetnameInput rangeOfString:@"colton dr"].location !=NSNotFound||[streetnameInput rangeOfString:@"colton"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the TB Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"DepartmentOfHealthEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDHSButton.hidden=NO;
    }
    if([streetnameInput rangeOfString:@"myer way"].location !=NSNotFound||[streetnameInput rangeOfString:@"myer"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Redwood Clinic"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"UHealthCareEmblem.png"];
        _labelToPass.text=title;
        self.hiddenRedwoodButton.hidden=NO;

    }
    if([streetnameInput rangeOfString:@"main street"].location !=NSNotFound||[streetnameInput rangeOfString:@"main st"].location !=NSNotFound||[streetnameInput rangeOfString:@"main"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Workforce Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"dwsEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDWSButton.hidden=NO;

    }
    if([streetnameInput rangeOfString:@"belgaro lane"].location !=NSNotFound||[streetnameInput rangeOfString:@"belgaro"].location !=NSNotFound)
    {
        NSString *message=[[NSString alloc]initWithFormat:@"Type no further! I think I know your client's appointment... click to proceed"];
        NSString *title = [[NSString alloc] initWithFormat:@"@ the Department of Health and Human Services"];
        _organizationQuestion.text=message;
        _organizationEmblem.image=[UIImage imageNamed:@"MedicaidEmblem.png"];
        _labelToPass.text=title;
        self.hiddenDHHSButton.hidden=NO;
 

}

}
@end
