//
//  InstructionsViewController.h
//  SensorStreaming
//
//  Created by Qays Poonawala on 2012-09-01.
//  Copyright (c) 2012 Orbotix, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionsViewController : UIPageViewController

@property (retain, nonatomic) IBOutlet UIImageView *instructionImage;
@property (nonatomic) int instructionPageNumber;

@end
