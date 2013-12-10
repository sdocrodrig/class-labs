//
//  MADViewController.m
//  Camera
//
//  Created by Danielle Rodriguez on 11/19/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import "MADViewController.h"


@interface MADViewController ()

@end

@implementation MADViewController {
    UIImage *image;
    NSURL *videoURL;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (image || videoURL)
    {
        [actionSheet addButtonWithTitle:@"Save"];
    }
    [actionSheet addButtonWithTitle:@"Camera Roll"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet addButtonWithTitle:@"Play Audio"];
    
    actionSheet.cancelButtonIndex=actionSheet.numberOfButtons - 1;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Save"])
    {
        if(image)
        {
            UIImageWriteToSavedPhotosAlbum (image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
        else if (videoURL)
        {
            NSString *urlString = [videoURL path];
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlString))
            {
                UISaveVideoAtPathToSavedPhotosAlbum(urlString, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
            }
        }
    }
    else if ([buttonTitle isEqualToString:@"Camera Roll"])
    {
        UIImagePickerController *imagePickerController=[[UIImagePickerController alloc] init];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;  imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeSavedPhotosAlbum];
                                            imagePickerController.allowsEditing=NO;
                                            imagePickerController.delegate=self;
                                            [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else if ([buttonTitle isEqualToString:@"Play Audio"])
    {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"callmemaybe" ofType:@"m4r"];
        NSURL *fileURL = [NSURL URLWithString:soundFilePath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        audioPlayer.delegate = self;
        [audioPlayer play];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player error:(NSError *)error
{
    audioPlayer = nil;
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    audioPlayer = nil;
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(error)
    {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Image saved" message:@"Image saved successfully to camera roll." delegate: nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    image = nil;
    videoURL = nil;
    _imageView.image=nil;
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        image = editedImage ? editedImage : originalImage;
        _imageView.image = image;
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error)
    {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Video saved" message:@"Video saved successfully to camera roll." delegate: nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
    if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.mediaTypes = [NSArray arrayWithObjects: (NSString *)kUTTypeImage, (NSString *)kUTTypeMovie, nil];
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else{
        NSLog (@"Can't access the camera");
    }
}
@end
