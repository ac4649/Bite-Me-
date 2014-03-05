//
//  BMDirectionView.m
//  Bite Me!
//
//  Created by Adrien Cogny on 2/23/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import "BMDirectionView.h"
#import "BMRestaurant.h"
#import <MapKit/MapKit.h>

@interface BMDirectionView()

@end

@implementation BMDirectionView

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    mapView.showsUserLocation = YES;
    mapView.userInteractionEnabled = YES;
    
    
    //Clear all other positions
    NSLog(@"Removing all Annotations");
    
    NSMutableArray * annotationsToRemove = [mapView.annotations mutableCopy] ;
    [annotationsToRemove removeObject:mapView.userLocation];
    [mapView removeAnnotations:annotationsToRemove];
    
    NSLog(@"Adding an Annotation for restaurant");
    
    NSNumber* foodLocationLat = [[NSNumber alloc] initWithDouble:0.098754556788];
    NSNumber* foodLocationLong =[[NSNumber alloc] initWithDouble:0.098754556788];
    
    CLLocationCoordinate2D foodPlace;
    foodPlace.longitude = [foodLocationLat doubleValue];
    foodPlace.latitude = [foodLocationLong doubleValue];
    
    NSLog(@"1");
    
    // Add an annotation
    BMRestaurant *annotation = [[BMRestaurant alloc] initWithTitle:@"YOU MUST GO HERE" andSubtitle:@"LOL" andFoodType:@"HAHA" andCoordinate:foodPlace];
    
    NSLog(@"2");
    
    [mapView addAnnotation:annotation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
