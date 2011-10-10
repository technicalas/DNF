//
//  DNFObjectManager.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface DNFObjectManager : RKObjectManager
{
    
}

- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString*)resourcePath delegate:(id<RKObjectLoaderDelegate>)delegate;
- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString *)resourcePath withParameters:(NSDictionary *)parameters delegate:(id<RKObjectLoaderDelegate>)delegate;
- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString*)resourcePath objectMapping:(RKObjectMapping*)objectMapping delegate:(id<RKObjectLoaderDelegate>)delegate;

@end
