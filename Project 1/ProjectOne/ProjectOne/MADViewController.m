//
//  MADViewController.m
//  ProjectOne
//

#import "MADViewController.h"

//beginning iOS 6 Development, chapter 7 was referenced in putting together this app

@interface MADViewController ()

@end

@implementation MADViewController


-(IBAction)buttonPressed
{
    NSInteger orgRow = [self.dependentPicker selectedRowInComponent:kOrgComponent];
    
    NSString *org = self.orgTypes[orgRow];
    NSString *message = [[NSString alloc] initWithFormat: @"View the documents needed for client's %@ appointment by selecting buttons for the Document Viewer", org];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Bring to Appointment"
                                                    message:message

                                                   delegate:nil
                                        cancelButtonTitle:@"Got It!"
                                          otherButtonTitles: nil];
    [alert show];
    

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"apptOrgs" withExtension: @"plist"];
    
    self.apptOrgs=[NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *allOrgs = [self.apptOrgs allKeys];
    NSArray *sortedOrgs = [allOrgs sortedArrayUsingSelector:@selector(compare:)];
    self.orgTypes=sortedOrgs;
    
    NSString *selectedOrg = self.orgTypes[0];
    self.apptTypes = self.apptOrgs[selectedOrg];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;

}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kOrgComponent){
        return [self.orgTypes count];
    }else {
        return [self.apptTypes count];
    }
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == kOrgComponent){
        return self.orgTypes[row];
    }else{
        return self.apptTypes[row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kOrgComponent) {
        NSString *selectedOrg = self.orgTypes[row];
        self.apptTypes = self.apptOrgs[selectedOrg];
        [self.dependentPicker reloadComponent:kApptComponent];
        [self.dependentPicker selectRow:0 inComponent:kApptComponent animated:YES];
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

}



- (IBAction)revealDoc:(UIButton *)sender {
    if(sender.tag==0)
    {
        _docViewer.image=[UIImage imageNamed:@"I-94.png"];
    }
    if(sender.tag==1)
    {
        _docViewer.image=[UIImage imageNamed:@"dmv.png"];
    }
    if(sender.tag==2)
    {
        _docViewer.image=[UIImage imageNamed:@"EIC.png"];
    }
    if(sender.tag==3)
    {
        _docViewer.image=[UIImage imageNamed:@"SSN.png"];
    }
    if(sender.tag==4)
    {
        _docViewer.image=[UIImage imageNamed:@"Medicaid.png"];
    }
}
-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

// Tell the system it should autorotate
- (BOOL) shouldAutorotate {
    return YES;
}
@end
