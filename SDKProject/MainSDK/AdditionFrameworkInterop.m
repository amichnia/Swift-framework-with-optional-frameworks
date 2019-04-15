//
//  AdditionFrameworkInterop.m
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

#import "AdditionFrameworkInterop.h"
@import AdditionalSDK;

@interface AdditionFrameworkInterop() <PrimeNumberCheckerDelegate>

@property (strong, nonatomic) PrimeNumberChecker *primeChecker;

@end

@implementation AdditionFrameworkInterop

+ (BOOL)additionalModuleAvailable {
    if ([AdditonalSDK class]) {
        return YES;
    } else {
        return NO;
    }
}

- (instancetype)init {
    self = [super init];
    if (self && [AdditionFrameworkInterop additionalModuleAvailable]) {
        _primeChecker = [[PrimeNumberChecker alloc] init];
        [_primeChecker setDelegate:self];
    }
    return self;
}

- (void)inspectWithNumber:(NSInteger)number {
    if ([AdditionFrameworkInterop additionalModuleAvailable]) {
        [_primeChecker inspectWithNumber:number];
    }
}

- (void)didFinishInspectingWithNumber:(NSInteger)number isPrime:(BOOL)isPrime {
    [_delegate didFinishInspectingWithNumber:number isPrime:isPrime];
}

@end
