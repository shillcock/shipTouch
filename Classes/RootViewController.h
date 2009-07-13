//
//  RootViewController.h
//  shipTouch
//
//  Created by Scott Shillcock on 7/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {

   UILabel *waveSpeedLabel;
   UILabel *waveAmplitudeLabel;
   UILabel *wavePeriodLabel;
   
   UISlider *waveSpeedSlider;
   UISlider *waveAmplitudeSlider;
   UISlider *wavePeriodSlider;
   
//   UIView *waveSpeedView;
}

@property (nonatomic, retain) IBOutlet UILabel *waveSpeedLabel;
@property (nonatomic, retain) IBOutlet UILabel *waveAmplitudeLabel;
@property (nonatomic, retain) IBOutlet UILabel *wavePeriodLabel;

@property (nonatomic, retain) IBOutlet UISlider *waveSpeedSlider;
@property (nonatomic, retain) IBOutlet UISlider *waveAmplitudeSlider;
@property (nonatomic, retain) IBOutlet UISlider *wavePeriodSlider;

//@property (nonatomic, retain) IBOutlet UIView *waveSpeedView;

-(IBAction) sliderValueChanged:(id)sender;

@end

