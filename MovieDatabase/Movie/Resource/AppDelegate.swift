//
//  AppDelegate.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?
    var genres = Genres.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        coordinator = Coordinator()
        
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        genres.fetchGenres()
        
        return true
    }
}
