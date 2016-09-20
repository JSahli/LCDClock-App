//
//  PListArchiver.m
//  LCDclock
//
//  Created by Jesse Sahli on 6/6/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "PListArchiver.h"

@implementation PListArchiver



+ (id) getPlistDictionaryObjectForKey:(NSString*) key {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pListPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Trial.plist"];
    NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:pListPath];
    return [defaultsDictionary objectForKey:key];
}



+ (void)writeToPlistDictionary: (id) object forKey:(NSString*) key{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pListPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Trial.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //check if dictionary exists yet with if/else
    if ([fileManager fileExistsAtPath:pListPath]){
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:pListPath atomically:YES];
    } else {
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]init];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:pListPath atomically:YES];
    }
 
}
@end


