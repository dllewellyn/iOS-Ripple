//
//  NSStringUrlEncode.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "NSString+NSStringUrlEncode.h"

@implementation NSString (NSStringUrlEncode)

-(NSString *) urlEncode {
    // Code stolen from here:
    // http://stackoverflow.com/questions/8088473/how-do-i-url-encode-a-string
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = (int) strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}
@end
