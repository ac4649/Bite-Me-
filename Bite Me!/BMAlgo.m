//
//  BMAlgo.m
//  Bite Me!
//
//  Created by Rafi Rizwan on 2/27/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import "BMAlgo.h"
#import "BMData.h"

@implementation BMAlgo{
    
    CLLocationManager *locationManager;
    
}

static BMAlgo *instance =nil;
+(BMAlgo *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [BMAlgo new];
        }
    }
    return instance;
}


-(void)firstStep
{
    
    //Get User Location
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    NSLog(@"locationManager.location = %@",locationManager.location);
    
    while (!locationManager.location) {
        NSLog(@"-");
    }
    
    NSLog(@"locationManager.location = %@",locationManager.location);

    userLoc = locationManager.location;
    
    
    //NSLog(@"userLoc = %@",userLoc);
    
    BMData *globalData=[BMData getInstance];
    
    
    
    
    //Calculate distance and place in distance array
    
    //[globalData.distanceArray removeAllObjects];
    
    NSMutableArray *tempDistanceArray = [[NSMutableArray alloc] init];
    

    
    
    //NSLog(@"self.userLoc %@", userLoc);
    
    
    for (int i = 0; i<globalData.dataLat.count; ++i) {
        
        //lat and long
        
        NSNumber* lat = [NSNumber numberWithDouble:[[globalData.dataLat objectAtIndex:i] doubleValue]];
        
        NSNumber* lng = [NSNumber numberWithDouble:[[globalData.dataLong objectAtIndex:i] doubleValue]];
        
        
        NSLog(@"lat: %@ lng: %@",lat,lng);
        
        NSNumber* deltaLat = [NSNumber numberWithDouble:[lat doubleValue]-userLoc.coordinate.latitude];
        
        NSNumber* deltaLong = [NSNumber numberWithDouble:[lng doubleValue]-userLoc.coordinate.longitude];

        NSLog(@"deltalat: %@ deltalng: %@",deltaLat,deltaLong);

        
        NSNumber* dist = [NSNumber numberWithDouble:sqrt(([deltaLat doubleValue]*[deltaLat doubleValue]) + ([deltaLong doubleValue]*[deltaLong doubleValue]))];
        
        
        //NSLog(@"dist = %@",dist);
        
        [tempDistanceArray insertObject:dist atIndex:i];
        
        

        
    }
    
    NSLog(@"distances : %@",tempDistanceArray);

    
    globalData.distanceArray = tempDistanceArray;
    
    //go through distance array, create selected restaurants array, selected ratings array and selected distance array
    
    [globalData.selectedRestaurants removeAllObjects];
    
    
    globalData.selectedRestaurants = [globalData.dataRestaurantArray mutableCopy];
    globalData.selectedRatings = [globalData.dataRatingsArray mutableCopy];
    globalData.selectedLat = [globalData.dataLat mutableCopy];
    globalData.selectedLong = [globalData.dataLong mutableCopy];

    
    

    
    for (int i=0;i<globalData.distanceArray.count;++i){
        
        if ([[globalData.distanceArray objectAtIndex:i] doubleValue] >= [[NSNumber numberWithDouble:0.0005] doubleValue]) {
        
            
            [globalData.selectedRestaurants removeObjectAtIndex:i];
            [globalData.selectedLat removeObjectAtIndex:i];
            [globalData.selectedLong removeObjectAtIndex:i];
            [globalData.selectedRatings removeObjectAtIndex:i];
            [globalData.distanceArray removeObjectAtIndex:i];
            
        
        }
        
        
        
    }
    
    NSLog(@"%@",globalData.selectedRestaurants);
    
    
    sleep(1);
    
    
}

-(void)secondStep
{
    
    sleep(1);
    
    
}

-(void)thirdStep
{
    
    sleep(1);
    
    
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Error Message", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        userLoc = currentLocation;
        //NSLog(@"User Lat = %f",locationlatuser);
        //NSLog(@"User Long = %f",locationlonguser);
    }
    else{
        
        NSLog(@"No Location");
    }
    
}



@end
