//
//  Public.swift
//  AdditionalSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import Foundation

@objc public class AdditonalSDK: NSObject {}

@objc public class PrimeNumberChecker: NSObject {
    @objc public var delegate: PrimeNumberCheckerDelegate?

    @objc public func inspect(number: Int) {
        guard number > 1 else {
            delegate?.didFinishInspecting(number: number, isPrime: false)
            return
        }
        guard number > 3 else {
            delegate?.didFinishInspecting(number: number, isPrime: true)
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {
            for i in 2...(number/2) {
                if number % i == 0 {
                    self.delegate?.didFinishInspecting(number: number, isPrime: false)
                    return
                }
            }
            self.delegate?.didFinishInspecting(number: number, isPrime: true)
        }
    }
}

@objc public protocol PrimeNumberCheckerDelegate {
    func didFinishInspecting(number: Int, isPrime: Bool)
}
