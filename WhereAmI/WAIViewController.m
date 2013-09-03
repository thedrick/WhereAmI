//
//  WAIViewController.m
//  WhereAmI
//
//  Created by Tyler Hedrick on 9/2/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "WAIViewController.h"

@interface WAIViewController ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *location;
@end

@implementation WAIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
  }
  return self;
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
  self.location = [locations objectAtIndex:0];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Error"
                                                  message:[NSString stringWithFormat:@"Error: %@", error]
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles:nil, nil];
  [alert show];
}

- (void)setLocation:(CLLocation *)location
{
  if ([location isEqual:_location]) {
    return;
  }
  
  _location = location;
  CLLocationCoordinate2D coordinate = _location.coordinate;
  self.latitudeLabel.text = [NSString stringWithFormat:@"%.6f", coordinate.latitude];
  self.longitudeLabel.text = [NSString stringWithFormat:@"%.6f", coordinate.longitude];
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

- (IBAction)getLocation:(UIButton *)sender
{
  [self.locationManager startUpdatingLocation];
}

@end
