//
//  RegisteredApplicationList.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisteredApplication.h"

// A way of notiying that the data has changed
@protocol DataChanged <NSObject>

/** 
 Notify that the data has changed at index
 @param index index in the list
 */
-(void) dataChangedAtIndex:(NSInteger) index;

/**
 Data has been added to the list
 @param addedApplication the application that was added to the list
 */
-(void) dataAdded:(RegisteredApplication * _Nonnull) addedAppliation;

@end

// This class is intended to be subclassed by whatever DataSource you want to use
// to store the data. Prefr it if we subclassed MutableArray but you then have to implement
// things such as adding to an array yourself
@interface RegisteredApplicationList : NSObject<DataChanged>

/**
 Get the singleton instance of this class
 @return shared instance of class
 */
+(RegisteredApplicationList * _Nullable) sharedInstance;

/**
 Initialise this class from the data source.
 */
-(instancetype _Nullable) initFromDataSource;

/**
 Get the object at index
 @param index to get object from
 @return an object at index
 */
-(RegisteredApplication* _Nullable) objectAtIndex:(NSUInteger) index;

/*
 Get number of elements
 */
-(NSUInteger) count;

/**
 Reload the data
 */
-(void) reload;

// Delegate
@property (weak) id<DataChanged> delegate;

@end
