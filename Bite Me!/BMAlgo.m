//
//  BMAlgo.m
//  Bite Me!
//
//  Created by Rafi Rizwan on 2/27/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import "BMAlgo.h"
#import "BMData.h"

@implementation BMAlgo

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
    
    BMData *globalData=[BMData getInstance];
    
    //Calculate distance and place in distance array
    
    [globalData.distanceArray removeAllObjects];
    
    for (int i = 0; i<globalData.dataLat.count; ++i) {
        
        //lat
        
        NSNumber* lat = [NSNumber numberWithDouble:[[globalData.dataLat objectAtIndex:i] doubleValue]];
        NSNumber* lng = [NSNumber numberWithDouble:[[globalData.dataLong objectAtIndex:i] doubleValue]];
        NSNumber* dist = [NSNumber numberWithDouble:sqrt([lat doubleValue]*[lat doubleValue] + [lng doubleValue]*[lng doubleValue])];
        
        NSLog(@"dist = %@",dist);
        
        [globalData.distanceArray addObject:dist];
        
        
        NSLog(@"distances : %@",globalData.distanceArray);

        
    }
    
    //go through distance array, create selected restaurants array, selected ratings array and selected distance array
    
    [globalData.selectedRestaurants removeAllObjects];
    
    
    for (int i=0;i<globalData.distanceArray.count;++i){
        
        if ([[globalData.distanceArray objectAtIndex:i] doubleValue] <= [[NSNumber numberWithDouble:60] doubleValue]) {
        
            [globalData.selectedRestaurants addObject:[globalData.dataRestaurantArray objectAtIndex:i]];
        
        }
        
        
        
    }
    
    
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


@end
