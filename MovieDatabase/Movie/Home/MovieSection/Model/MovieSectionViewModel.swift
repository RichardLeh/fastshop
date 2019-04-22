//
//  MovieSectionViewModel.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

public protocol MovieSectionViewModelProtocol {
    var title: String { get }
    var movies: [Movie] { get }
}

struct MovieSectionViewModel: MovieSectionViewModelProtocol {
    var title: String
    var movies: [Movie]
    init() {
        title = ""
        movies = []
    }
}

extension MovieSectionViewModel {
    init(title: String, movies: [Movie]) {
        self.title = title
        self.movies = movies
    }
}
