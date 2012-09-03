//
//  GameSettingsViewController.m
//  SensorStreaming
//
//  Created by Qays Poonawala on 2012-09-01.
//  Copyright (c) 2012 Orbotix, Inc. All rights reserved.
//

#import "GameSettingsViewController.h"
#import "GameSettings.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController
@synthesize gameDurationLabel;
@synthesize turnDurationLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDurationLabel:nil];
    [self setGameDurationLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
            (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}
- (IBAction)gameDurationChanged:(UIButton *)sender {
    gameSeconds = [[sender titleForState:UIControlStateNormal] intValue] * 60;
}
- (IBAction)turnDurationChanged:(UIButton *)sender {
    turnSeconds = [[sender titleForState:UIControlStateNormal] intValue];
    [turnDurationLabel set];
}

- (void)dealloc {
    [turnDurationLabel release];
    [gameDurationLabel release];
    [super dealloc];
}
@end
