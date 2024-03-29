//
//  AppConfig.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 28/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FBAccessTokenKey @"FBAccessTokenKey"
#define FBExpirationDateKey @"FBExpirationDateKey"
#define appIDFB @"247552555285262"
#define FBUsernameKey @"IDUserFBKey"
#define kLoginDate @"loginDate"

#define kNumberOfPacks @"kNumberOfPacks"
#define kPriceUnit @"kPriceUnit"

typedef enum typeOfRequest{
    kRequestTypeUserInfo = 11,
    kRequestTypeSendInfo
}kTypeOfRequest;
