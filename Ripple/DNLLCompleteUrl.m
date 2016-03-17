//
//  DNLLCompleteUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLCompleteUrl.h"

@implementation DNLLCompleteUrl

-(instancetype _Nullable) initWithUrl:(NSURL * _Nonnull) url {
    self = [super init];
    
    self.urlType = CompleteUrl;
    
    return self;
}
@end
