//
//  File.swift
//  MainSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import Foundation

@objc public protocol InteropDelegate: class {
    @objc func didFinishInspecting(number: Int, isPrime: Bool)
}

public protocol NumberInspectorDelegate: class {
    func didFinishInspecting(number: Int, foundFeatures: [String])
}

public class NumberInspector {
    public static var isAdditionalSDKAvailable: Bool {
        return AdditionFrameworkInterop.additionalModuleAvailable()
    }

    public weak var delegate: NumberInspectorDelegate?

    private let interop: AdditionFrameworkInterop
    private var cache: [Int: [String]] = [:]


    public init() {
        interop = AdditionFrameworkInterop()
        interop.delegate = self
    }

    /// Inspects given number and verifies its features
    ///
    /// - Parameter number: Some number
    /// - Returns: Array of number features
    public func inspect(number: Int) {
        var features: [String] = []

        if number % 2 == 0 {
            features.append("- is even")
        } else {
            features.append("- is odd")
        }

        if number > 0 {
            features.append("- is positive")
        } else if number < 0 {
            features.append("- is negative")
        }

        cache[number] = features

        guard NumberInspector.isAdditionalSDKAvailable else {
            // We can immediately call upon delegate
            delegate?.didFinishInspecting(number: number, foundFeatures: features)
            return
        }

        interop.inspect(withNumber: number)
    }
}

extension NumberInspector: InteropDelegate {

    public func didFinishInspecting(number: Int, isPrime: Bool) {
        var features = cache[number] ?? []

        if isPrime {
            features.append("- is prime")
        } else {
            features.append("- is not prime")
        }

        delegate?.didFinishInspecting(number: number, foundFeatures: features)
    }
}
