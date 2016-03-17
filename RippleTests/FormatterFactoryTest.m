//
//  FormatterFactoryTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLCompleteUrl.h"
#import "DNLLFormatterFactory.h"
#import "DNLLRegisterUrl.h"

@interface FormatterFactoryTest : XCTestCase

@end

@implementation FormatterFactoryTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFormatterCanGetAValidCompleteUrl {
    NSURL *url = [NSURL URLWithString:@"ripple://com.ripple.complete"];
    DNLLCompleteUrl * compl = (DNLLCompleteUrl*)[DNLLFormatterFactory getFormatterFor:url];
    XCTAssertNotNil(compl);
    XCTAssertEqual(compl.urlType, CompleteUrl);
}

-(void) testFormatterCanGetAValidRegisterUrl {
    NSString *resp = @"response";
    NSString *exampleString = [@"This is an example of a lovely string" urlEncode];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"ripple://com.ripple.register#%@-%@", resp, exampleString]];
    
    DNLLRegisterUrl *regUrl = (DNLLRegisterUrl*)[DNLLFormatterFactory getFormatterFor:url];
    XCTAssertNotNil(regUrl);
    XCTAssertTrue([resp isEqualToString:regUrl.responseName]);
    XCTAssertTrue([exampleString isEqualToString:regUrl.appDescription]);
    XCTAssertEqual(regUrl.urlType, RegisterUrl);
}

@end
