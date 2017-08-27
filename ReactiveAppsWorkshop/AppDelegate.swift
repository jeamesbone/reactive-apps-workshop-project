//
//  AppDelegate.swift
//  ReactiveAppsWorkshop
//
//  Created by Jeames Bone on 26/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let searchViewModel = MemeSearchViewModel(searchService: MemeSearchService(), imageLoader: MemeImageLoader())
        let searchViewController = storyboard.instantiateViewController(withIdentifier: "MemeSearchViewController") as! MemeSearchViewController
        searchViewController.viewModel = searchViewModel

        let navigationController = UINavigationController(rootViewController: searchViewController)

        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

