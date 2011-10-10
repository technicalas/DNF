//
//  DNFObjectManager.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DNFObjectManager.h"

@implementation DNFObjectManager

static NSString *const tokenAPI = @"e1dc31173ab347b4ea5db02fc68ae8ab";

- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString*)resourcePath 
                                    delegate:(id<RKObjectLoaderDelegate>)delegate
{
    return [self loadObjectsAtResourcePath:resourcePath 
                            withParameters:nil 
                                  delegate:delegate];
}

- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString *)resourcePath 
                              withParameters:(NSDictionary *)parameters 
                                    delegate:(id<RKObjectLoaderDelegate>)delegate
{
    RKObjectLoader* loader = [self objectLoaderWithResourcePath:resourcePath 
                                                       delegate:delegate];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:tokenAPI 
                                                                     forKey:@"token"];
    
    if (parameters != nil || parameters.count > 0) {
        [params addEntriesFromDictionary:parameters];
    }
    
    loader.params = params;
    loader.method = RKRequestMethodPOST;
    
	[loader send];
    
	return loader;
}

- (RKObjectLoader*)loadObjectsAtResourcePath:(NSString*)resourcePath 
                               objectMapping:(RKObjectMapping*)objectMapping 
                                    delegate:(id<RKObjectLoaderDelegate>)delegate
{
	RKObjectLoader* loader = [self objectLoaderWithResourcePath:resourcePath 
                                                       delegate:delegate];
    
    NSDictionary *params = [NSDictionary dictionaryWithObject:tokenAPI 
                                                       forKey:@"token"];
    
    loader.params = params;
    loader.method = RKRequestMethodPOST;
    loader.objectMapping = objectMapping;
    
	[loader send];
    
	return loader;
}

@end
