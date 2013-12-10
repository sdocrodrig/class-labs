//  MADViewController.m
//  ScrabbleQ


#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
// when define instance variable in .m, no other class has access to it
// Instance variable words that is an NSArray
// _words is only if defined using @property in .h
// accessible in all methods of the class
{
    NSArray *words;
}

- (void)viewDidLoad
{
    //only need to load data once so use viewDidLoad
    [super viewDidLoad];
    // First get a bundle
    NSBundle *bundle=[NSBundle mainBundle]; //
    // on bundle call method where put name of file of type plist
    NSString *plistPath = [bundle pathForResource:@"qwordswithoutu1" ofType:@"plist"]; // retrieve the path of continents.plist
    // Assign to a string object - plistPath
    words = [[NSArray alloc] initWithContentsOfFile:plistPath];
    // Alloc init or words array - always allocate memory and initialize in order to use
    self.title=@"Words";
    // set title of controller to be words
}

//Reuired methods for UITableViewDataSource
//Customize the number of rows in the section
// return NSInteger of how many rows there are
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [words count]; //returns the number of continents
}

// Displays the table view cells
// Important method that will use alot
// Every time display a cell
//Return type: UITableViewCell, sent two parameters - tableView and NSIndexPath
// Setting up object string of *CellIdentifier with name CellIdentifier. 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Static variable in objective C are allocated for the lifetime of the program rather than just method. Scope is just the class
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Defining cell class object - method called on table view class passing the identifier set up previously
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
// Configure Cell
    // Use row property to get that row from the array and put into cell
    cell.textLabel.text=[words objectAtIndex:indexPath.row]; // sets the text of the cell with the row being requested
    // if wanted to make subtitle from words in array, done here
    // cell.detailTextLabel.text= @"Q no U";
    
    return cell;
    
}

// Handling user interaction is through UITableView Delegate
// UITableViewDelegate method is called when a row is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    NSString *rowValue=[words objectAtIndex:indexPath.row]; //sets the title of the selected row
    NSString *message =[[NSString alloc] initWithFormat: @"You selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //deselects the row that had been choosen
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
