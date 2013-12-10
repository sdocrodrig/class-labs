//
//  MADMasterViewController.m
//  harrypotter
//
//  Created by Danielle Rodriguez on 10/31/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import "MADMasterViewController.h"

#import "MADDetailViewController.h"

@interface MADMasterViewController () 
@end

@implementation MADMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//    self.detailViewController = (MADDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:@"harrypotter" ofType:@"plist"]; //retrieve the path of harrypotter.plist
    NSDictionary *characterInfo=[NSDictionary dictionaryWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
    self.characters=[characterInfo objectForKey:@"characters"]; //assigns all the character keys to our array
    self.detailViewController=(MADDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Configure the cell.
    NSDictionary *characterChoosen=[_characters objectAtIndex:indexPath.row]; //assigns dictionary item of the row
    cell.textLabel.text = [characterChoosen objectForKey:@"name"]; //assigns the value of the name to the cell
    return cell;


}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *characterChoosen = [self.characters
                                      objectAtIndex:indexPath.row]; //assigns dictionary item of the row
    NSString *url=[characterChoosen objectForKey:@"url"]; //assigns the url of the row
    NSString *name=[characterChoosen objectForKey:@"name"]; // assigns the name of the row
    self.detailViewController.title=name;
    self.detailViewController.detailItem = url;
}

@end
