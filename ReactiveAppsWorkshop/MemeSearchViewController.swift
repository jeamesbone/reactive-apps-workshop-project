//
//  ViewController.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 26/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class MemeSearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var goButton: UIButton!

    var viewModel: MemeSearchViewModel!

    override func viewDidLoad() {
        
    }
}

extension MemeSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let configurationViewController = storyboard?.instantiateViewController(withIdentifier: "MemeConfigurationViewController") as? MemeConfigurationViewController else { return }

        navigationController?.pushViewController(configurationViewController, animated: true)
    }
}

extension MemeSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfImages
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageProducer = viewModel.imageProducer(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeImageCell", for: indexPath)
        if let cell = cell as? MemeImageCell {
            cell.configure(with: imageProducer)
        }
        return cell
    }
}
