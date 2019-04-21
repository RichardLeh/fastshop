//
//  HomeViewController.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    var service: MovieServiceProtocol
    
    lazy var mainView: HomeView = { //swiftlint:disable force_cast
        self.view as! HomeView
    }()
    
    init(service: MovieServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HomeView(frame: self.view.frame)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadPopularData()
        loadTopRatedData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func loadPopularData() {
        service.fetchPopularMovies(page: 0) { result in
            switch result {
            case .success(let response):
                guard let movies = response.results else {
                    return
                }
                
                let popular = PopularMovieSectionViewModel(movies: movies)
                self.mainView.popularViewModel = popular
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func loadTopRatedData() {
        service.fetchTopRatedMovies(page: 0) { result in
            switch result {
            case .success(let response):
                guard let movies = response.results else {
                    return
                }
                
                let topRated = TopRatedMovieSectionViewModel(movies: movies)
                self.mainView.topRatedViewModel = topRated
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}
