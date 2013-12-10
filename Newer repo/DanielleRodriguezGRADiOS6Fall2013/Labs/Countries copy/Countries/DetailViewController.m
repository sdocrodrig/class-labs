//  DetailViewController.m
//  Countries


#import "DetailViewController.h"
#import "CountryViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;

}




-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData]; //reloads the data in the tableView
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//Returns the number of rows int he section
    return [_countryList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        cell.textLabel.text=[_countryList objectAtIndex:indexPath.row];
    return cell;
}


// Create a valid method - all unwind methods take as a parameter UIStoryboardSegue action and return an IBAction
// For cancel button - ctrl click on cancel button and drag to green exit icon below - give segue the identifier cancelSegue
// For done button - ctrl click on done button and drag to green exit icon below - give segue identifier donSegue
-(IBAction)unwindCountry:(UIStoryboardSegue *)segue
{
    if ([segue.identifier isEqualToString:@"doneSegue"]){
        CountryViewController *source=[segue sourceViewController];
        if (source.addedCountry!=nil)
        [_countryList addObject:source.addedCountry];
        [self.tableView reloadData];
    }
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger row=[indexPath row]; //gets the row being edited
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_countryList removeObjectAtIndex:row]; //removes the row being deleted from the array
        // Delete the row from the data source
        //Different parameters for withRowAnimation
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
   // else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //}
}




// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSUInteger fromRow=[fromIndexPath row]; //row moving from
    NSUInteger toRow=[toIndexPath row]; // row moving to
    NSString *moveCountry=[_countryList objectAtIndex:fromRow]; //remove the country from the row
    [_countryList removeObjectAtIndex:fromRow]; //remove the country from the row
    [_countryList insertObject:moveCountry atIndex:toRow]; //insert the country in new order
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
