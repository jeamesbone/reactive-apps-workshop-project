//
//  NetworkTest.swift
//  ReactiveAppsExamples
//
//  Created by Jeames Bone on 28/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

enum NetworkError: Error {
    case failed
}

struct Model {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class NetworkService {
    func get(url: URL) -> SignalProducer<(Data, URLResponse), NetworkError> {
        let dataSignal = SignalProducer<(Data, URLResponse), NetworkError> { input, disposable in
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let response = response {
                    input.send(value: (data, response))
                    input.sendCompleted()
                } else {
                    input.send(error: NetworkError.failed)
                }
            }.resume()
        }
        return dataSignal
    }
}


