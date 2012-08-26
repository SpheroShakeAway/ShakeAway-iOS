//
//  Game.h
//  SensorStreaming
//
//  Created by Matthew Harding on 8/24/12.
//  Copyright (c) 2012 Orbotix, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

@interface Game : NSObject
{
    BOOL ledON;
}


- (void)startGame : (double) totalGameTime;
- (Team *)redTeam;
- (Team *)blueTeam;
        
@end
