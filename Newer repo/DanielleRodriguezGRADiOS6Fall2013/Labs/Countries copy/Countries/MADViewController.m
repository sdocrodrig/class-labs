//  MADViewController.m
//  Countries


#import "MADViewController.h"
#import "DetailViewController.h"
#import "ContinentInfoViewController.h"


@interface MADViewController ()
{
    // MutableDictionary means you can change it
    // Private, don't need it anywhere else, so we put this Dictionary in .m file
    NSMutableDictionary *continentData;
}
@end

@implementation MADViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"]; //retrieve the path of continents.plist
    // Only difference from lab 10 is the "Mutable"
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath]; // loads the contents of the plist file into a dictionary
    //the dictionary uses the continents as the keys and a NSArray with the countries for each continent.
    continentData=dictionary;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count]; //returns the number of continents
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *rowData=[continentData allKeys]; //creates an array with all keys from our dictionary
    cell.textLabel.text=[rowData objectAtIndex:indexPath.row]; //sets the text of the cell with the row being requested
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"countrysegue"]){
        DetailViewController *countryViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender]; // changed for detail disclosure accessory button
        //NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys]; //creates an array with all keys from our dictionary
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title];
        
        if  ([segue.identifier isEqualToString:@"continentsegue"]) {
            ContinentInfoViewController
            *infoViewController=segue.destinationViewController;
            NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
            NSArray *rowData=[continentData allKeys];
            infoViewController.name=[rowData objectAtIndex:indexPath.row];
            infoViewController.number=[NSString stringWithFormat:@"%d", [[continentData objectForKey:infoViewController.name]count]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
