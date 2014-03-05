//
//  BMRestaurant.m
//  Bite Me!
//
//  Created by Adrien Cogny on 2/23/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import "BMRestaurant.h"

@implementation BMRestaurant

@synthesize name, rating, coordinate, foodType;



- (id)initWithTitle:(NSString *)annotationtitle andSubtitle:(NSString *)annotationsubtitle andFoodType:(NSString *)cuisine andCoordinate:(CLLocationCoordinate2D)location{
    
    name = annotationtitle;
    rating = annotationsubtitle;
    coordinate = location;
    foodType = cuisine;
    return self;
    
    
}


@end
