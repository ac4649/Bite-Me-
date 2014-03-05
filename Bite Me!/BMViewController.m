//
//  BMViewController.m
//  Bite Me!
//
//  Created by Adrien Cogny on 2/23/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import "BMViewController.h"
#import "BMData.h"
#import "BMAlgo.h"

@interface BMViewController ()

@end

@implementation BMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"VIEW DID LOAD");
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIButton* BiteMeButton = [UIButton buttonWithType:UIButtonTypeCustom];
                              
                              
    
    
    
    
    [BiteMeButton setFrame:CGRectMake(screen.size.width/2 - 100, screen.size.height/2-100, 200,200)];
    
    [BiteMeButton setBackgroundImage:[UIImage imageNamed:@"BiteButton.png"] forState:normal];
    //[BiteMeButton setTitle:@"BITE ME BUTTON" forState:normal];
    
    [BiteMeButton addTarget:self action:@selector(Start:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BiteMeButton];
    
    
    NSLog(@"subviews = %@",self.view.subviews);

    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender {
    
    BMAlgo *algo=[BMAlgo getInstance];

    

    //Creating background thread and setting it to run mainAlgoRunMethod(see bellow)
    [self performSelectorInBackground:@selector(mainAlgoRunMethod) withObject:nil];
    
    
    
    while (!algo.done) {
        NSLog(@"threading is good");
        if (algo.check1 == [NSNumber numberWithBool:1]) {
            
            [sender setBackgroundImage:[UIImage imageNamed:@"BiteButton2.png"] forState:normal];

            
        }
        if (algo.check2 == [NSNumber numberWithBool:1]) {
            [sender setBackgroundImage:[UIImage imageNamed:@"BiteButton3.png"] forState:normal];
        }
    
    }
    
    if (algo.done) {
        BMData *globalData=[BMData getInstance];
        
        NSLog(@"distance: %@", globalData.distanceArray);
        
        [sender removeFromSuperview];
    }

    
    
}


-(void)mainAlgoRunMethod
{
    BMAlgo *algo=[BMAlgo getInstance];

   // BMAlgo *algo=[BMAlgo getInstance];

    algo.check1 = [NSNumber numberWithBool:0];
    algo.check2 = [NSNumber numberWithBool:0];
    algo.done = [NSNumber numberWithBool:0];
    
    [algo firstStep];
    
    algo.check1 = [NSNumber numberWithBool:1];
    
    [algo secondStep];
    
    algo.check2 = [NSNumber numberWithBool:1];
    
    [algo thirdStep];
    
    //algo.done = [NSNumber numberWithBool:1];
    

    
    
    
}

@end
