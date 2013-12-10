//  docViewController.m
//  Project 2


#import "docViewController.h"
#import "Constants.h"


@interface docViewController ()

@end

@implementation docViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
    }
    return self;
}
*/
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage=info[UIImagePickerControllerEditedImage];
    self.imageView.image=chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.passedLabel.text=self.passedText;
    self.title=NSLocalizedString(@"ImagesTitle", @"");
    
    NSString *orgTitleTrigger=_passedLabel.text;
    
    if([orgTitleTrigger rangeOfString:@"Social Security Administration"].location !=NSNotFound)
        {
            self.imageView.animationImages = @[[UIImage imageNamed:@"I-94.png"], [UIImage imageNamed:@"EIC.png"], [UIImage imageNamed:@"dmv.png"]];
            _headerView.image=[UIImage imageNamed:@"SocialSecurity_Header.png"];
            
            
        }
    if([orgTitleTrigger rangeOfString:@"Department of Workforce Services"].location !=NSNotFound)
    {
        self.imageView.animationImages = @[[UIImage imageNamed:@"I-94.png"]];
        
        _headerView.image=[UIImage imageNamed:@"employmentintake.png"];
        
    }
    if([orgTitleTrigger rangeOfString:@"TB Clinic"].location !=NSNotFound)
    {
        self.imageView.animationImages = @[[UIImage imageNamed:@"Medicaid.png"], [UIImage imageNamed:@"dmv.png"]];
        
        _headerView.image=[UIImage imageNamed:@"TB Clinic Meds (1).png"];
    }
    if([orgTitleTrigger rangeOfString:@"Department of Health and Human Services"].location !=NSNotFound)
    {
        self.imageView.animationImages = @[[UIImage imageNamed:@"I-94.png"], [UIImage imageNamed:@"EIC.png"], [UIImage imageNamed:@"dmv.png"], [UIImage imageNamed:@"SSN.png"]];
        _headerView.image=[UIImage imageNamed:@"welfareenrollment.png"];
    }
    if([orgTitleTrigger rangeOfString:@"Redwood Health Clinic"].location !=NSNotFound)
    {
        self.imageView.animationImages = @[[UIImage imageNamed:@"dmv.png"], [UIImage imageNamed:@"Medicaid.png"]];
        _headerView.image=[UIImage imageNamed:@"healthclinicappt.png"];
    }

    self.imageView.animationDuration = 7.0;
    [self.imageView stopAnimating];
    
    //Set appropriate accessibility labels
    [self.imageView setIsAccessibilityElement:YES];
    [self.imageView setAccessibilityLabel:self.title];

    }
    




#pragma mark - UIController delegate methods

//called after this controller's view was dismissed, covered or otherwise hidden
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.imageView stopAnimating];
}

//called after this controller's view will appear
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.imageView startAnimating];
    
    //for aesthetic reasons , make nav bar black for this particular page
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectPhoto:(UIButton *)sender {

    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

-(void)highlightName{
    if ((self.imageView.image=[UIImage imageNamed:@"dmv.png"])){
        _stateID.textColor=[UIColor redColor];
    }
    else if ((self.imageView.image=[UIImage imageNamed:@"I-94.png"])){
        _i94.textColor=[UIColor redColor];
    }
    else if ((self.imageView.image=[UIImage imageNamed:@"SSN.png"])){
        _socialSecurityCard.textColor=[UIColor redColor];
    }
    else if ((self.imageView.image=[UIImage imageNamed:@"Medicaid.png"])){
        _medicareCard.textColor=[UIColor redColor];
    }
    else if ((self.imageView.image=[UIImage imageNamed:@"EIC.png"])){
        _EIN.textColor=[UIColor redColor];
    }
}


@end
