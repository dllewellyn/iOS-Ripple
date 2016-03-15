//
//  RegisteredApplicationList.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplicationList.h"

@implementation RegisteredApplicationList

// Singleton instance
static RegisteredApplicationList *instance;

+(RegisteredApplicationList *) sharedInstance {
    
    if (instance == nil) {
        instance = [[self alloc] initFromDataSource];
    }
    
    return instance;
}

-(void) reload {
    instance = [self initFromDataSource];
}

-(instancetype) initFromDataSource {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
    return nil;
}

-(RegisteredApplication*) objectAtIndex:(NSUInteger) index {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
    return nil;
}

-(NSUInteger) count {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
    return -1;
}

-(void) dataChangedAtIndex:(NSInteger) index {
    if (self.delegate != nil) {
        [self.delegate dataChangedAtIndex:index];
    }
}

-(void) dataAdded:(RegisteredApplication * _Nonnull) addedAppliation {
    if (self.delegate != nil) {
        [self.delegate dataAdded:addedAppliation];
    }
}
@end
