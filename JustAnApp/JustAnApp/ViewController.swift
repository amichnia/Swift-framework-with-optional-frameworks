//
//  ViewController.swift
//  JustAnApp
//
//  Created by Andrzej Michnia on 07/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import UIKit
import MainSDK
import AdditionalSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = MainSDK.isAdditionalSDKAvailable ? .green : .gray
    }

    @IBAction func statusAction() {
        MainSDK.performAdditionalWorkIfPossible()
    }
}
