//
//  RootViewController.h
//  shipTouch
//
//  Created by Scott Shillcock on 7/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface RootViewController : UIViewController {

   NSManagedObjectContext *managedObjectContext; 
   UINavigationController *navigationController;

   UILabel *waveSpeedLabel;
   UILabel *waveAmplitudeLabel;
   UILabel *wavePeriodLabel;
   
   UISlider *waveSpeedSlider;
   UISlider *waveAmplitudeSlider;
   UISlider *wavePeriodSlider;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext; 
@property (nonatomic, retain) UINavigationController *navigationController;

@property (nonatomic, retain) IBOutlet UILabel *waveSpeedLabel;
@property (nonatomic, retain) IBOutlet UILabel *waveAmplitudeLabel;
@property (nonatomic, retain) IBOutlet UILabel *wavePeriodLabel;

@property (nonatomic, retain) IBOutlet UISlider *waveSpeedSlider;
@property (nonatomic, retain) IBOutlet UISlider *waveAmplitudeSlider;
@property (nonatomic, retain) IBOutlet UISlider *wavePeriodSlider;

-(IBAction)sliderValueChanged:(id)sender;

-(IBAction)showLogController;

@end

