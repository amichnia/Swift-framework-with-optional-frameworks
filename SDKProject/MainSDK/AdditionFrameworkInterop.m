//
//  AdditionFrameworkInterop.m
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

#import "AdditionFrameworkInterop.h"
@import AdditionalSDK;

@interface AdditionFrameworkInterop() <AdditionalDelegate>

@property (strong, nonatomic) AdditonalSDK *sdkInstance;

@end

@implementation AdditionFrameworkInterop

+ (BOOL)additionalModuleAvailable
{
    if ([AdditonalSDK class])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self && [AdditionFrameworkInterop additionalModuleAvailable])
    {
        _sdkInstance = [[AdditonalSDK alloc] init];
        [_sdkInstance setDelegate:self];
    }
    return self;
}

- (void)performWork
{
    if ([AdditionFrameworkInterop additionalModuleAvailable])
    {
        [_sdkInstance performWork];
    }
}

- (void)doSomething
{
    NSLog(@"DID SOMETHING");
}

- (void)doSomethingElse
{
    NSLog(@"DID SOMETHING ELSE");
}

@end
