//
//  SegmentedControlViewController.swift
//  ReactiveAppsExamples
//
//  Created by Jeames Bone on 28/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import UIKit

class SegmentedControlViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        segmentedControl.reactive
            .controlEvents(.valueChanged)
            .map { segmentControl in
                return self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex)
            }
            .observeValues { title in
                self.label.text = title
            }
    }
}
