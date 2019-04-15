//
//  ViewController.swift
//  JustAnApp
//
//  Created by Andrzej Michnia on 07/04/2019.
//  Copyright © 2019 Andrzej Michnia. All rights reserved.
//

import UIKit
import MainSDK

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!

    private let inspector = NumberInspector()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = NumberInspector.isAdditionalSDKAvailable ? .green : .gray
        inspector.delegate = self
    }

    @IBAction func statusAction() {
        guard let text = numberField.text, !text.isEmpty else { return }
        guard let number = Int(text) else { return }

        inspector.inspect(number: number)
    }

    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController: NumberInspectorDelegate {
    
    func didFinishInspecting(number: Int, foundFeatures: [String]) {
        let texts = ["Number: \(number)"] + foundFeatures

        DispatchQueue.main.async {
            self.statusLabel.text = texts.joined(separator: "\n")
        }
    }
}
