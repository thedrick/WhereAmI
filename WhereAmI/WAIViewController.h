//
//  WAIViewController.h
//  WhereAmI
//
//  Created by Tyler Hedrick on 9/2/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WAIViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;

- (IBAction)getLocation:(UIButton *)sender;
@end
