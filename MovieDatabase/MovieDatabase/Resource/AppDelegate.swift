//
//  AppDelegate.swift
//  MovieDatabase
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        coordinator = Coordinator(controller: HomeViewController())
        
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
