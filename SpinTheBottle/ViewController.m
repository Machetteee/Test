//
//  ViewController.m
//  SpinTheBottle
//
//  Created by Waris Ali on 7/20/13.
//  Copyright (c) 2013 Waris Ali. All rights reserved.
//

#import "ViewController.h"
#import "RotationGestureRecognizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)addRotationGestureToView:(UIView *)view
{
    RotationGestureRecognizer *rotation = [[RotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotating:)];
    [view addGestureRecognizer:rotation];
    
}
- (void)addTapGestureToView:(UIView *)view numberOfTaps:(NSInteger)numberOfTaps
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tap setNumberOfTapsRequired:numberOfTaps];
    [view addGestureRecognizer:tap];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self addRotationGestureToView:[self view]];
    //[self addTapGestureToView:[self view] numberOfTaps:1];
    
    [self addRotationGestureToView:[self bottleImageView]];
    [self addTapGestureToView:[self bottleImageView] numberOfTaps:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

- (void)rotating:(RotationGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformRotate([view transform], [recognizer rotation])];
}

- (void)tapped:(UITapGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformMakeRotation(0)];
}


@end
