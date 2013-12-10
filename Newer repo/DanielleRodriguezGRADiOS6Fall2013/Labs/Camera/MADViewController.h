//
//  MADViewController.h
//  Camera
//
//  Created by Danielle Rodriguez on 11/19/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


@interface MADViewController : UIViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
@end
