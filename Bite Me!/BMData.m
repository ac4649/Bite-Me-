//
//  BMData.m
//  HyperLocal
//
//  Created by Adrien Cogny on 1/31/14.
//  Copyright (c) 2014 Adrien Cogny. All rights reserved.
//

#import "BMData.h"


@implementation BMData

@synthesize dataArray;

static BMData *instance =nil;
+(BMData *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [BMData new];
        }
    }
    return instance;
}

@end
