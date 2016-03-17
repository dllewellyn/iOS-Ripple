//
//  RegisterUrlTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLRegisterUrl.h"

@interface RegisterUrlTest : XCTestCase

@end

@implementation RegisterUrlTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRegisterParamsAreSetCorrectly {
    NSString *resp = @"response";
    NSString *exampleString = [@"This is an example of a lovely string" urlEncode];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"ripple://com.ripple.register#%@-%@", resp, exampleString]];
    DNLLRegisterUrl *regUrl = [[DNLLRegisterUrl alloc] initWithUrl:url];
    XCTAssertNotNil(regUrl);
    XCTAssertTrue([resp isEqualToString:regUrl.responseName]);
    XCTAssertTrue([exampleString isEqualToString:regUrl.appDescription]);
}

-(void) testGetANilResponseWhenTheresNoHash {
    NSString *resp = @"response";
    NSString *exampleString = [@"This is an example of a lovely string" urlEncode];
    
    // Forget the #
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"ripple://com.ripple.register%@-%@", resp, exampleString]];
    XCTAssertNil([[DNLLRegisterUrl alloc] initWithUrl:url]);
}

-(void) testGetANilResponseWhenTheresNoSeperator {
    NSString *resp = @"response";
    NSString *exampleString = [@"This is an example of a lovely string" urlEncode];
    
    // Forget the #
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"ripple://com.ripple.register#%@%@", resp, exampleString]];
    XCTAssertNil([[DNLLRegisterUrl alloc] initWithUrl:url]);
}
@end
