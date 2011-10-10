//
//  InformationManager.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationManager : NSObject
{
    NSUInteger *_days;
    NSDate *currentDate;
}

+ (NSString *)daysElapsed;
+ (NSString *)currentDate;

@end
