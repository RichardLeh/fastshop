//
//  TopRatedMovieSectionViewModel.swift
//  Movie
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

struct TopRatedMovieSectionViewModel: MovieSectionViewModelProtocol {
    var title: String
    var movies: [Movie]
    
    init(movies: [Movie]) {
        self.title = "Top Rated"
        self.movies = movies
    }
}
