//
//  InternalResponders.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "InternalResponders.h"
#import "SpecialResponders.h"
#import <Crashlytics/Crashlytics.h>

@interface InternalResponders()

// Remove readonly
@property NSArray<Responder*> *responders;

@end

@implementation InternalResponders

-(instancetype _Nullable) initWithResponder:(NSArray<Responder*>*) responders {
    self = [self init];
    
    if (self != nil)
    {
        self.responders = responders;
    }
    
    return self;
}

-(instancetype _Nullable) initFromFile {
    self = [self init];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    if (self != nil) {
        
        NSArray *responders = nil;
        
        if (self.doesSaveDetailsExist)
        {
            responders = [[NSArray alloc] initWithContentsOfFile:self.getSavePath];
        }
        else
        {
            responders = [[NSArray alloc] initWithContentsOfFile:self.getPath];
        }
        
        for (NSDictionary *dict in responders)
        {
            Responder *responder = [SpecialResponders getResponder:dict];
            [temp addObject:responder];
        }
        
        self.responders = [temp mutableCopy];
    }
    
    return self;
}

/**
 Does save detail exist
 
 @return does the file exist
 */
-(BOOL) doesSaveDetailsExist {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:self.getSavePath];
}

/**
 Save this array to file
 
 @return success or not
 */
-(BOOL) saveToFile {
    NSMutableArray *fileArray = [[NSMutableArray alloc] init];
    
    for (Responder *responder in self.responders)
    {
        [fileArray addObject:[responder getDictionaryForResponder]];
    }
    
    return [fileArray writeToFile:self.getSavePath atomically:YES];
}

/**
 Get the place where we will save the file to

 @returns the save path
 */
-(NSString *) getSavePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"save_responders.plist"];
    return filePath;
}

/** 
 The file for defaults, saved in the bundle
 
 @returns the path in the bundle
 */
-(NSString* ) getPath {
   return [[NSBundle mainBundle] pathForResource:@"responders" ofType:@"plist"];
}

-(BOOL) deleteSaved {
    NSError *error;
    
    BOOL deleted = [[NSFileManager defaultManager] removeItemAtPath:self.getSavePath error:&error];
    
    if (error != nil)
    {
        [[Crashlytics sharedInstance] recordError:error];
    }
    
    return deleted;
    
    
}
@end
