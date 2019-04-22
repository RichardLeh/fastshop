//
//  UpcomingMovieSectionViewModel.swift
//  Movie
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

struct UpcomingMovieSectionViewModel: MovieSectionViewModelProtocol {
    var title: String
    var movies: [Movie]
    
    init(movies: [Movie]) {
        self.title = ""
        self.movies = movies
    }
}
