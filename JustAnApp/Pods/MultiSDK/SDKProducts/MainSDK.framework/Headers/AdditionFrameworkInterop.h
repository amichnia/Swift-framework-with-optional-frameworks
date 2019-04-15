//
//  AdditionFrameworkInterop.h
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MainSDK/MainSDK-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionFrameworkInterop : NSObject

@property (weak, nonatomic) id<InteropDelegate> delegate;

+ (BOOL)additionalModuleAvailable;

- (instancetype)init;
- (void)inspectWithNumber:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
