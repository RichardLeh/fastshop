//
//  Coordinator.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class Coordinator {
    let rootViewController: UIViewController

    init() {
        let service = MovieService()
        let homeViewController = HomeViewController(service: service)
        
        self.rootViewController = homeViewController
    }
}
