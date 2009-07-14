//
//  RootViewController.m
//  shipTouch
//
//  Created by Scott Shillcock on 7/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "dmzShipModuleiPhone.h"
#import "dmzLogViewController.h"
#import "dmzUIKitUtil.h"

#define ANIMATION_DURATION 1.5
#define SPEED_TAG 100
#define AMPLITUDE_TAG 102
#define PERIOD_TAG 103
#define INFO_TAG 104


@implementation RootViewController

@synthesize managedObjectContext, navigationController;
@synthesize waveSpeedLabel, waveAmplitudeLabel, wavePeriodLabel;
@synthesize waveSpeedSlider, waveAmplitudeSlider, wavePeriodSlider;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
   
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
       
    }
   
    return self;
}


- (void)dealloc {

   [managedObjectContext release];
   [navigationController release];
   
   [waveSpeedLabel release];
   [waveAmplitudeLabel release];
   [wavePeriodLabel release];
   
   [waveSpeedSlider release];
   [waveAmplitudeSlider release];
   [wavePeriodSlider release];
   
   [super dealloc];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 
   [super viewDidLoad];
   
   UIKitImproveSliderAccuracy (waveSpeedSlider);
   UIKitImproveSliderAccuracy (waveAmplitudeSlider);
   UIKitImproveSliderAccuracy (wavePeriodSlider);
}


- (void)viewWillAppear:(BOOL)animated {

   // set all the objects to their off screen positions
   UIView *speedView = [self.view viewWithTag:SPEED_TAG];
   CGRect speedOnScreenFrame = speedView.frame;
   speedView.frame = CGRectOffset (speedOnScreenFrame, -500, 0);

   UIView *amplitudeView = [self.view viewWithTag:AMPLITUDE_TAG];
   CGRect amplitudeOnScreenFrame = amplitudeView.frame;
   amplitudeView.frame = CGRectOffset (amplitudeOnScreenFrame, 500, 0);

   UIView *periodView = [self.view viewWithTag:PERIOD_TAG];
   CGRect periodOnScreenFrame = periodView.frame;
   periodView.frame = CGRectOffset (periodOnScreenFrame, -500, 0);
   
   UIView *infoView = [self.view viewWithTag:INFO_TAG];
   CGRect infoOnScreenFrame = infoView.frame;
   infoView.frame = CGRectOffset (infoOnScreenFrame, 0, 800);
   
   // start a new animation
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:ANIMATION_DURATION];
	
	// set this object as the delegate and hook up selectors for the callbacks we want to use
	[UIView setAnimationDelegate:self];
	[UIView setAnimationWillStartSelector:@selector(animationWillStart:context:)];
	[UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
	
	// now set the objects to their on screen position so they'll be animated onto the screen
   speedView.frame = speedOnScreenFrame;
   amplitudeView.frame = amplitudeOnScreenFrame;
   periodView.frame = periodOnScreenFrame;
   infoView.frame = infoOnScreenFrame;
	
	// commit the animation to finish it up
	[UIView commitAnimations];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

/*
- (void)didReceiveMemoryWarning {
   
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
*/

- (IBAction)sliderValueChanged:(id)sender {

   dmz::ShipModuleiPhone *mod (dmz::ShipModuleiPhone::get_instance ());
   
   if (mod) {
      
      if (sender == waveSpeedSlider) {
      
         waveSpeedLabel.text = [NSString stringWithFormat:@"%.0f", [waveSpeedSlider value]];
         mod->set_wave_speed ([waveSpeedSlider value]);
      }
      else if (sender == waveAmplitudeSlider) {
         
         waveAmplitudeLabel.text = [NSString stringWithFormat:@"%.0f", [waveAmplitudeSlider value]];
         mod->set_wave_amplitude ([waveAmplitudeSlider value]);
      }
      else if (sender == wavePeriodSlider) {
         
         wavePeriodLabel.text = [NSString stringWithFormat:@"%.0f", [wavePeriodSlider value]];
         mod->set_wave_period ([wavePeriodSlider value]);
      }
   }
}


-(IBAction)showLogController {

   NSManagedObjectContext *context = [self managedObjectContext];
   
   if (context) {
      
      dmzLogViewController *logViewController = [[dmzLogViewController alloc] initWithStyle:UITableViewStylePlain];
      
      logViewController.managedObjectContext = context;
      
      UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:logViewController];
      [logViewController release];
      
      aNavigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
      
      [self presentModalViewController:aNavigationController animated:YES];
      
      [aNavigationController release];
   }
}


@end
