//
//  HLConnection.h
//  HyperLocal
//
//  Created by Adrien Cogny on 2/6/14.
//  Copyright (c) 2014 Adrien Cogny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMConnection : NSObject{
    
    NSString *articleURL;
    
}


-(void)connect;

+(BMConnection*)getInstance;

@property(nonatomic,retain)NSString *articleURL;



@end


