//
//  BMAlgo.h
//  Bite Me!
//
//  Created by Rafi Rizwan on 2/27/14.
//  Copyright (c) 2014 Bite Me!. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMAlgo : NSObject{
    
    NSNumber* check1;
    NSNumber* check2;
    NSNumber* done;
    
}

@property(nonatomic, retain)NSNumber* check1;
@property(nonatomic, retain)NSNumber* check2;
@property(nonatomic, retain)NSNumber* done;


+(BMAlgo*)getInstance;
-(void)firstStep;
-(void)secondStep;
-(void)thirdStep;


@end
