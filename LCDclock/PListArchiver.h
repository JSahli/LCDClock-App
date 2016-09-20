//
//  PListArchiver.h
//  LCDclock
//
//  Created by Jesse Sahli on 6/6/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PListArchiver : NSObject

+ (id) getPlistDictionaryObjectForKey:(NSString*) key;
+ (void)writeToPlistDictionary: (id) object forKey:(NSString*) key;

@end
