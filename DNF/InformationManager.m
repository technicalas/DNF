//
//  InformationManager.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InformationManager.h"
#import "AppConfig.h"

@implementation InformationManager

static InformationManager *_sharedManager = nil;

#pragma mark - (De)allocation and initialization
+ (InformationManager *) sharedManager
{
    if (_sharedManager == nil) {
        _sharedManager = [[self alloc] init];
    }
    return _sharedManager;
}

+ (id) alloc
{
    NSAssert(_sharedManager == nil, @"Attempted to allocate a second of a singleton");
    return [super alloc]; 
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Methods
+ (NSString *)priceUnit
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *unitPrice = [defaults objectForKey:kPriceUnit];
    if (unitPrice == nil) {
        return @"0";
    }
    return unitPrice;
}

+ (NSString *)packsPerDay
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *packs = [defaults objectForKey:kNumberOfPacks];
    if (packs == nil) {
        return @"0";
    }
    return packs;
}

+ (NSString *)daysElapsed
{
    NSUInteger days = 0;
    NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginDate];
    if (date == nil) {
        days = 0;
    }else{
        NSDate *now = [NSDate date];
        NSTimeInterval timeInterval = [now timeIntervalSinceDate:date];
        if (timeInterval > 0) {
            days = timeInterval / (60*60*24);
        }else{
            days = 0;
        }
    }
    return [NSString stringWithFormat:@"%.3d", days];;
}

+ (NSString *)currentDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    NSDate *now = [NSDate date];
    NSString *formattedDateString = [dateFormatter stringFromDate:now];
    return formattedDateString;
}

+ (float)calculateSavings
{
    int days = [[self daysElapsed] intValue];
    int packs = [[self packsPerDay] intValue];
    float price = [[self priceUnit] floatValue];
    float savings = days*packs*price;
    return savings;
}

+ (void)savePrice:(NSString *)price
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:price forKey:kPriceUnit];
    [defaults synchronize];
}

+ (void)savePacks:(NSString *)packs
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:packs forKey:kNumberOfPacks];
    [defaults synchronize];
}

+ (void)scheduleNotifications
{
    UILocalNotification *localNotifications = [[UILocalNotification alloc] init];
    localNotifications.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotifications.alertBody = @"Information";
    localNotifications.alertAction = @"View";
    localNotifications.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotifications];
    [localNotifications release];
}

+ (void)unscheduleNotifications
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
