//
//  ViewController.h
//  SensorStreaming
//
//  Created by Brian Smith on 03/28/12.
//  Copyright (c) 2011 Orbotix, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"

@class RKDeviceAsyncData;

@interface ViewController : UIViewController {
    BOOL robotOnline;
    BOOL ledON;
    int  packetCounter;
    NSTimer *timer; // timer for game
    int remainingSeconds; // time for game play
    double startGameTime1;
    BOOL alarm;
}

@property (nonatomic, retain) IBOutlet UILabel *redShakesValueLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueShakesValueLabel;
@property (nonatomic, retain) IBOutlet UILabel *countdownLabel;

-(void)setupRobotConnection;
-(void)handleRobotOnline;
-(void)handleAsyncData:(RKDeviceAsyncData *)asyncData;
-(void)sendSetDataStreamingCommand;

@end

