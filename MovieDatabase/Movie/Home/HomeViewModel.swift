//
//  HomeViewModel.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var items: [Movie] { get }
}

struct HomeViewModel: HomeViewModelProtocol {
    var items: [Movie]
    init() {
        items = []
    }
}

extension HomeViewModel {
    init(movies: [Movie]) {
        self.items = movies
    }
}
