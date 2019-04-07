//
//  AdditionFrameworkInterop.h
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionFrameworkInterop : NSObject

+ (BOOL)additionalModuleAvailable;

- (instancetype)init;
- (void)performWork;

@end

NS_ASSUME_NONNULL_END
