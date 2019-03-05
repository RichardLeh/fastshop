//
//  HomeViewController.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    lazy var controllerView: HomeView! = { //swiftlint:disable force_cast
        self.view as! HomeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = HomeView(frame: self.view.frame)
    }
}
