//
//  InstructionsViewController.m
//  SensorStreaming
//
//  Created by Qays Poonawala on 2012-09-01.
//  Copyright (c) 2012 Orbotix, Inc. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController
@synthesize instructionImage;
@synthesize instructionPageNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backButton:(id)sender {
    // dec by 1, or go home
}
- (IBAction)nextButton:(id)sender {
    switch (instructionPageNumber++) {
        case 2:
            instructionImage.image = [UIImage imageNamed:@"Instruction-PG-2.png"];
            break;
        case 3:
            instructionImage.image = [UIImage imageNamed:@"Instruction-PG-3.png"];
            break;
        case 4:
            instructionImage.image = [UIImage imageNamed:@"Instruction-PG-4.png"];
            break;
        case 5:
            instructionImage.image = [UIImage imageNamed:@"Instruction-PG-5.png"];
            break;
            
        default:
            break;
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    instructionPageNumber=1;
}

- (void)viewDidUnload
{
    [self setInstructionImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
                (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
    } else {
        return YES;
    }
}

- (void)dealloc {
    [instructionImage release];
    [super dealloc];
}
@end
