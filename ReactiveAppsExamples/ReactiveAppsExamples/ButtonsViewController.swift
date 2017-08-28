//
//  ViewController.swift
//  ReactiveAppsExamples
//
//  Created by Jeames Bone on 28/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

class ButtonsViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let button1Signal = button1.reactive
            .controlEvents(.touchUpInside)
        let button2Signal = button2.reactive
            .controlEvents(.touchUpInside)

        let stringSignal: Signal<String, NoError> =
            Signal.merge(button1Signal, button2Signal)
            .map { button in
                return self.emoji(for: button)
            }

        stringSignal.observeValues { string in
            self.label.text = string
        }
    }

    func emoji(for button: UIButton) -> String {

        switch button {
        case button1: return "1️⃣"
        case button2: return "2️⃣"
        default: return "😱"
        }
    }
}

