//
//  MemeSearchViewModel.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 27/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift

struct MemeImage {
//    let url: URL
}

class MemeImageLoader {
    enum Error: Swift.Error { case failed }

    func load(_ image: MemeImage) -> SignalProducer<UIImage, Error> {
        return SignalProducer(error: .failed)
    }
}

class MemeSearchService {
    enum Error: Swift.Error { case failed }

    func search(_ searchString: String) -> SignalProducer<[MemeImage], Error> {
        return .empty
    }
}

class MemeSearchViewModel {
    private let searchService: MemeSearchService
    private let imageLoader: MemeImageLoader

    init(searchService: MemeSearchService, imageLoader: MemeImageLoader) {
        self.searchService = searchService
        self.imageLoader = imageLoader
    }

    private lazy var searchResults: Property<[MemeImage]> = {
        return Property(initial: [], then: self.searchAction.values)
    }()

    private lazy var searchAction: Action<String, [MemeImage], MemeSearchService.Error> = {
        return Action { input in
//            return self.searchService.search(input)
            return SignalProducer(value: [MemeImage(), MemeImage()])
        }
    }()

    func search(_ searchString: String, completion: @escaping () -> Void) {
        searchAction.apply(searchString).on(completed: completion).start()
    }

    var numberOfImages: Int {
        return searchResults.value.count
    }

    func imageProducer(for indexPath: IndexPath) -> SignalProducer<UIImage, MemeImageLoader.Error> {
        return imageLoader.load(self.searchResults.value[indexPath.row])
    }
}
