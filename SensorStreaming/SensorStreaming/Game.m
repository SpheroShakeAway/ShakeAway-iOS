//
//  Game.m
//  SensorStreaming
//
//  Created by Matthew Harding on 8/24/12.
//  Copyright (c) 2012 Orbotix, Inc. All rights reserved.
//

#import "Game.h"
#import "RobotKit/RobotKit.h"
#import "RobotUIKit/RobotUIKit.h"

@interface Game()
@property (nonatomic, strong) Team *redTeam;
@property (nonatomic, strong) Team *blueTeam;
@property (nonatomic, strong) Team *currentTeam;
@end

@implementation Game

@synthesize redTeam     = _redTeam;
@synthesize blueTeam    = _blueTeam;
@synthesize currentTeam = _currentTeam;

- (Team *)redTeam
{
    if (!_redTeam)
    {
        _redTeam = [[Team alloc] init];
        [_redTeam setR: 1.0];
        [_redTeam setG: 0.0];
        [_redTeam setB: 0.0];
    }
    return _redTeam;
}

- (Team *) blueTeam
{
    if (!_blueTeam)
    {
        _blueTeam = [[Team alloc] init];
        [_redTeam setR: 0.0];
        [_redTeam setG: 0.0 ];
        [_redTeam setB: 1.0 ];
    }
    return _blueTeam;
}

- (Team *) currentTeam
{
    return _currentTeam;
}

- (void) setCurrentTeam:(Team *)team
{
    _currentTeam = team;
}

- (void)decideWinner
{
    if (self.redTeam.shakesCount > self.blueTeam.shakesCount)
    {
        [self setCurrentTeam:self.redTeam];
    }
    else if (self.redTeam.shakesCount < self.blueTeam.shakesCount)
    {
        [self setCurrentTeam:self.blueTeam];
    }
    else
    {
        // Tie
    }
}

- (void)takeTurn : (Team *) currentTeam
                 : (double) waitTime    // time while ball is flashing (in sec)
                 : (double) turnTime    // time while ball is solid color (in sec)
{
    double startTurnTime = CFAbsoluteTimeGetCurrent();
    double currentTurnTime = CFAbsoluteTimeGetCurrent();
    
    while ((currentTurnTime - startTurnTime) < waitTime)
    {
        // During this while loop, spin the ball and display white
        [RKRGBLEDOutputCommand sendCommandWithRed:1.0 green:1.0 blue:1.0];
        [RKRawMotorValuesCommand sendCommandWithLeftMode: RKRawMotorModeForward
                                        leftPower:(RKRawMotorPower) 255
                                        rightMode:RKRawMotorModeForward
                                       rightPower:(RKRawMotorPower) 255];
        currentTurnTime = CFAbsoluteTimeGetCurrent();
    }
    while ((currentTurnTime - startTurnTime) < (waitTime + turnTime))
    {
        // During this while loop, color should be steady in the current team's color
        [RKRGBLEDOutputCommand sendCommandWithRed:currentTeam.r green:currentTeam.g blue:currentTeam.b];
        [RKRawMotorValuesCommand sendCommandWithLeftMode: RKRawMotorModeForward
                                               leftPower:(RKRawMotorPower) 0
                                               rightMode:RKRawMotorModeForward
                                              rightPower:(RKRawMotorPower) 0];
        currentTurnTime = CFAbsoluteTimeGetCurrent();
    }
}

- (void)startGame : (double) totalGameTime
{
    
    double startGameTime = CFAbsoluteTimeGetCurrent();
    double currentGameTime = CFAbsoluteTimeGetCurrent();
    [self setCurrentTeam : self.redTeam];
    
    while ((currentGameTime - startGameTime) < totalGameTime)
    {
        [self takeTurn: self.currentTeam : 5.0 : 5.0];
        if (self.currentTeam == self.redTeam)
        {
            [self setCurrentTeam : self.blueTeam];
        }
        else
        {
            [self setCurrentTeam : self.redTeam];
        }
        currentGameTime = CFAbsoluteTimeGetCurrent();
    }
    [self decideWinner];
    [self toggleLED: NO];
}

- (void)toggleLED : (BOOL) whiteBool
{
    //BOOL whiteBool = [receivedObject boolValue];
    /*Toggle the LED on and off*/
    if (ledON) {
        ledON = NO;
        [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:0.0];
    } else {
        ledON = YES;
        if (whiteBool)
        {
            [RKRGBLEDOutputCommand sendCommandWithRed:1.0 green:1.0 blue:1.0];
        }
        else
        {
            [RKRGBLEDOutputCommand sendCommandWithRed:self.currentTeam.r
                                                green:self.currentTeam.g
                                                 blue:self.currentTeam.b];
        }
        [self toggleLED:whiteBool];
//        [self performSelector:@selector(toggleLED:) withObject:receivedObject afterDelay:0.5];
    }
}

@end
