//
//  InternalResponders.h
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Responder.h"

@interface InternalResponders : NSObject


/**
 Init with responders
 
 @param responders list of type 'Responders'
 
 @returns InternalResponders instance
 */
-(instancetype _Nullable) initWithResponder:(NSArray<Responder* > * _Nonnull) responders;

/**
 Init from file

 @returns an instance of internal responders
 */
-(instancetype _Nullable) initFromFile;

// A list of internal responders
@property (readonly) NSArray<Responder* >  * _Nonnull responders;

// Save this to file
-(BOOL) saveToFile;

// Delete
-(BOOL) deleteSaved;

// Does the save file exist 
-(BOOL) doesSaveDetailsExist;

@end
