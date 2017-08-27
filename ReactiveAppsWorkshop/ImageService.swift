//
//  ImageService.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 27/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import ReactiveSwift
import Result

enum ImageServiceError: Error {
    case searchFailed(with: Error?)
}

class ImageService {
    let sdk: FakeImageSDK

    init(sdk: FakeImageSDK) {
        self.sdk = sdk
    }

    func search(query: String) -> SignalProducer<[MemeImage], ImageServiceError> {
        return SignalProducer { input, disposable in
            self.sdk.searchImages(searchString: query, callback: { (images, error) in
                if let images = images {
                    input.send(value: images)
                    input.sendCompleted()
                } else {
                    input.send(error: .searchFailed(with: error))
                }
            })
        }
    }
}
