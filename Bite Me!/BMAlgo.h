//
//  BMAlgo.h
//  Bite Me!
//
//  Created by Rafi Rizwan on 2/27/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include <CoreLocation/CLLocationManager.h>

@interface BMAlgo : NSObject <CLLocationManagerDelegate>{
    
    NSNumber* check1;
    NSNumber* check2;
    NSNumber* done;
    
    //CLLocationManager* locationManager;
    CLLocation* userLoc;
    

    
}

@property(nonatomic, retain)NSNumber* check1;
@property(nonatomic, retain)NSNumber* check2;
@property(nonatomic, retain)NSNumber* done;
//@property(nonatomic, retain)CLLocationManager* locationManager;
@property(nonatomic, retain)CLLocation* userLoc;



+(BMAlgo*)getInstance;
-(void)firstStep;
-(void)secondStep;
-(void)thirdStep;


@end
