//
//  MemeImageCell.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 27/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import UIKit
import ReactiveSwift

private let failedImage = UIImage(named: "sadpepe")

class MemeImageCell: UITableViewCell {
    @IBOutlet weak var memeImageView: UIImageView!
    var disposable: Disposable?

    func configure(with image: SignalProducer<UIImage, MemeImageLoader.Error>) {
        self.disposable = image.startWithResult { result in
            switch result {
            case .success(let image): self.memeImageView.image = image
            case .failure: self.memeImageView.image = failedImage
            }
        }
    }

    override func prepareForReuse() {
        self.disposable?.dispose()
        self.memeImageView.image = nil
    }
}
