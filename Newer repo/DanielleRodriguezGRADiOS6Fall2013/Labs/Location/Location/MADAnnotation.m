//
//  MADAnnotation.m
//  Location
//
//  Created by Danielle Rodriguez on 12/3/13.
//  Copyright (c) 2013 sdrodrig. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation 

//Initializes an annotation instance
-(id)initWithCoordinate:(CLLocationCoordinate2D)coor{
    _coordinate=coor;
    _title=@"You're here";
    _subtitle=[NSString stringWithFormat:@"Latitude: %f. Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    return self;
}

//changes location of the annotation
-(void) moveAnnotation:(CLLocationCoordinate2D)newCoordinate{
    [self willChangeValueForKey:@"coordinate"]; //informs the receiver that the coordinate is about to change.
    [self willChangeValueForKey:@"subtitle"]; //informs the receiver that the subtitle is about to change.
    _coordinate = newCoordinate;
    _subtitle = [[NSString alloc] initWithFormat:@"Latitude: %f. Longitutde: %f", _coordinate.latitude, _coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"]; //informs the receiver that the coordinate has changed.
    [self didChangeValueForKey:@"subtitle"]; //informs the receiver that the subtitle has changed. 
}

@end
