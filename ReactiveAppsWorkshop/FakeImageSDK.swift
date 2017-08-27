//
//  FakeNetworkService.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 27/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import Foundation

class FakeImageSDK {
    func searchImages(searchString: String, callback: @escaping ([MemeImage]?, NSError?) -> ()) {
        let images: [MemeImage]
        switch searchString {
        case "memes": images = []
        default: images = []
        }

        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: TimeInterval(arc4random_uniform(1000)/1000))
            if arc4random_uniform(5) == 0 {
                callback(nil, NSError())
            } else {
                callback(images, nil)
            }
        }
    }
}

