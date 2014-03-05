//
//  BMData.h
//  HyperLocal
//
//  Created by Adrien Cogny on 1/31/14.
//  Copyright (c) 2014 Adrien Cogny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMData : NSObject{
    
    
    NSArray *dataArray;
    NSMutableData *dataData;
    NSNumber *gotData;
    
    
    
    
    NSMutableArray *dataRestaurantArray;
    NSMutableArray *dataRatingsArray;
    NSMutableArray *dataLat;
    NSMutableArray *dataLong;
    
    NSMutableArray *distanceArray;
    
    
    NSMutableArray *selectedRestaurants;
    NSMutableArray *selectedRatings;
    NSMutableArray *selectedLat;
    NSMutableArray *selectedLong;
    
    
    
}


@property(nonatomic,retain)NSArray *dataArray;
@property(nonatomic,retain)NSMutableData *dataData;
@property(nonatomic,retain)NSNumber *gotData;
@property(nonatomic,retain)NSMutableArray *dataRestaurantArray;
@property(nonatomic,retain)NSMutableArray *dataRatingsArray;
@property(nonatomic,retain)NSMutableArray *dataLat;
@property(nonatomic,retain)NSMutableArray *dataLong;

@property(nonatomic,retain)NSMutableArray *distanceArray;

@property(nonatomic,retain)NSMutableArray *selectedRestaurants;
@property(nonatomic,retain)NSMutableArray *selectedRatings;
@property(nonatomic,retain)NSMutableArray *selectedLat;
@property(nonatomic,retain)NSMutableArray *selectedLong;




+(BMData*)getInstance;

@end
