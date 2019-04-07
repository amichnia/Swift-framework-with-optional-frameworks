//
//  Public.swift
//  AdditionalSDK
//
//  Created by Andrzej Michnia on 06/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import Foundation

@objc public class AdditonalSDK: NSObject {
    @objc public var delegate: AdditionalDelegate?

    @objc public func performWork() {
        delegate?.doSomething()
        delegate?.doSomethingElse()
    }
}

@objc public protocol AdditionalDelegate {
    func doSomething()
    func doSomethingElse()
}
