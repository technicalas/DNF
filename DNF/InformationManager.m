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
    int mins = 60;
    int hrs = 60*mins;
    int days = 24*hrs;
    int month = 30*days;
    
    NSNumber* firstNot = [NSNumber numberWithInt:20*mins];
    NSString *firstString = @"20 minutes après la dernière cigarette. La pression sanguine et les pulsations de cœur redeviennent normale";
    NSArray *first = [NSArray arrayWithObjects:firstNot, firstString, nil];
    
    NSNumber* secondNot = [NSNumber numberWithInt:8*hrs];
    NSString *secondString = @"8 heures après la dernière cigarette. La quantité de monoxyde de carbone dans le sang diminue de moitié. L’oxygénation des cellules redevient normale";
    NSArray *second = [NSArray arrayWithObjects:secondNot, secondString, nil];
    
    NSNumber* thirdNot = [NSNumber numberWithInt:24*hrs];
    NSString *thirdString = @"24 heures après la dernière cigarette. Le risque d’infarctus du myocarde diminue déjà. Les poumons commencent à éliminer le mucus et les résidus de fumée. Le corps ne contient plus de nicotine";
    NSArray *third = [NSArray arrayWithObjects:thirdNot, thirdString, nil];
    
    NSNumber* fourthNot = [NSNumber numberWithInt:48*hrs];
    NSString *fourthString = @"48 heures après la dernière cigarette. Le gout et l’odorat s’améliorent. Les terminaisons nerveuses gustatives commencent à repousser";
    NSArray *fourth = [NSArray arrayWithObjects:fourthNot, fourthString, nil];
    
    NSNumber* fifthNot = [NSNumber numberWithInt:72*hrs];
    NSString *fifthString = @"72 heures après la dernière cigarette. Respirez devient plus facile. Les bronchent commencent a se relâcher et on se sent plus énergique";
    NSArray *fifth = [NSArray arrayWithObjects:fifthNot, fifthString, nil];
    
    NSNumber* sixthNot = [NSNumber numberWithInt:2*month];
    NSString *sixthString = @"2 semaines à 3 mois après la dernière cigarette. La toux et la fatigue diminuent. On récupère du souffle. On marche plus facilement";
    NSArray *sixth = [NSArray arrayWithObjects:sixthNot, sixthString, nil];
    
    NSNumber* seventhNot = [NSNumber numberWithInt:5*month];
    NSString *seventhString = @"1 a 9 mois après la dernière cigarette. Les cils bronchiques repoussent. On est de moins en mois essouflé";
    NSArray *seventh = [NSArray arrayWithObjects:seventhNot, seventhString, nil];
    
    NSArray *notifs = [NSArray arrayWithObjects:first, second, third, fourth, fifth, sixth, seventh, nil];
    
    for (NSArray *notif in notifs) {
        UILocalNotification *localNotifications = [[UILocalNotification alloc] init];
        localNotifications.fireDate = [NSDate dateWithTimeIntervalSinceNow:[[notif objectAtIndex:0] intValue]];
        localNotifications.alertBody = [notif objectAtIndex:1];
        localNotifications.alertAction = @"View";
        localNotifications.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotifications];
        [localNotifications release];
    }
}

+ (void)unscheduleNotifications
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
