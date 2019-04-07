//
//  File.swift
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import Foundation

public class MainSDK {
    public static var isAdditionalSDKAvailable: Bool {
        return AdditionFrameworkInterop.additionalModuleAvailable()
    }

    static var interOp = AdditionFrameworkInterop()

    public static func performAdditionalWorkIfPossible() {
        guard isAdditionalSDKAvailable else {
            return print("Additional SDK not available")
        }

        interOp.performWork()
    }
}
