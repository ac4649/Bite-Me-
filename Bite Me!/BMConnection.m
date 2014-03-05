//
//  BMConnection.m
//  HyperLocal
//
//  Created by Adrien Cogny on 2/6/14.
//  Copyright (c) 2014 Adrien Cogny. All rights reserved.
//

#import "BMConnection.h"
#import "BMData.h"


@implementation BMConnection

static BMConnection *instance =nil;
+(BMConnection *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [BMConnection new];
        }
    }
    return instance;
}


-(void)connect{
    
    BMData *globalData=[BMData getInstance];
    globalData.dataData = [NSMutableData data];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:self.articleURL]];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
}

#pragma mark - NSURLConnectionDataDelegate
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    BMData *globalData=[BMData getInstance];
    
    NSLog(@"didReceiveResponse");
    [globalData.dataData setLength:0];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    BMData *globalData=[BMData getInstance];
    NSLog(@"received %d bytes",data.length);
    [globalData.dataData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    BMData *globalData=[BMData getInstance];
    
    //NSLog(@"%@", [NSString stringWithCString:[globalData.dataData bytes] encoding:NSUTF8StringEncoding]);
    
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[globalData.dataData length]);
    
    
    
    // convert from JSON to NSDict
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:globalData.dataData options:kNilOptions error:&myError];
    
    
    //NSLog(@"DATA dict %@",res);
    
    NSLog(@"count data %lu", (unsigned long)[res count]);
    
    NSDictionary *responsedictionary = [res objectForKey:@"response"];
    
    NSDictionary *groups = [responsedictionary objectForKey:@"groups"];
    
    
    //NSLog(@"GroupsArray = %@", groups);
    //NSLog(@"GroupsArray for key items = %@", [groups valueForKey:@"items"]);
    
    NSDictionary *items = [groups valueForKey:@"items"];

    NSDictionary *food = [items valueForKey:@"venue"];
    
    NSDictionary *locations = [food valueForKey:@"location"];
    
    //NSLog(@"food %@", food);
    
    //NSLog(@"food %@", [food valueForKey:@"name"]);
    //NSLog(@"food %@", [food valueForKey:@"rating"]);

    NSArray *AllRestaurantNames = [food valueForKey:@"name"];
    NSArray *AllRestaurantRatings = [food valueForKey:@"rating"];
    NSArray *AllRestaurantLat = [locations valueForKey:@"lat"];
    NSArray *AllRestaurantLong = [locations valueForKey:@"lng"];

    
    NSArray *RestaurantNames = [AllRestaurantNames objectAtIndex:0];
    NSArray *RestaurantRatings = [AllRestaurantRatings objectAtIndex:0];
    NSArray *RestaurantLatitude = [AllRestaurantLat objectAtIndex:0];
    NSArray *RestaurantLongitude = [AllRestaurantLong objectAtIndex:0];


    globalData.dataRestaurantArray = RestaurantNames;
    globalData.dataRatingsArray = RestaurantRatings;
    globalData.dataLat = RestaurantLatitude;
    globalData.dataLong = RestaurantLongitude;
    
    //NSLog(@"%@",AllRestaurantNames.count);
    
    //NSLog(@"Restaurant[0] = %@ Ratting = %@",[RestaurantNames objectAtIndex:0], [RestaurantRatings objectAtIndex:0]);
    
    //Listing All the restaurants and ratings
    /*
    for (int i = 0; i < RestaurantNames.count; i++) {
        NSLog(@"Restaurant[%d] = %@ Ratting = %@, lat = %@ , long = %@",i,[RestaurantNames objectAtIndex:i], [RestaurantRatings objectAtIndex:i], [RestaurantLatitude objectAtIndex:i], [RestaurantLongitude objectAtIndex:i]);

    }
    */

    //created _AllArticles array to have complete set of all articles, can then do whatever I want with them.
    
    
    globalData.gotData = [NSNumber numberWithInt:1];
    
    NSLog(@"app done = %@",globalData.gotData);
    
}

@end



