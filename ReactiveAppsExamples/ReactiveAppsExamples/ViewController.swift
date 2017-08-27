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

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        button1.reactive
            .controlEvents(.touchUpInside)
            .observeValues { button in
                self.label.text = emoji(for: button)
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

