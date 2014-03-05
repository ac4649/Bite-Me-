//
//  BMRestaurant.h
//  Bite Me!
//
//  Created by Adrien Cogny on 2/23/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BMRestaurant : NSObject <MKAnnotation>{
    
	NSString *name;
    NSString *rating;
    NSString *foodType;
    CLLocationCoordinate2D coordinate;

}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *foodType;

- (id)initWithTitle:(NSString *)annotationtitle andSubtitle:(NSString *)annotationsubtitle andFoodType:(NSString *)cuisine andCoordinate:(CLLocationCoordinate2D)location;

@end
