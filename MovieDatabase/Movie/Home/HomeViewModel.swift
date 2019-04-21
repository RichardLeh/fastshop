//
//  HomeViewModel.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var popularMovieSection: MovieSectionViewModelProtocol { get }
    var topRatedMovieSection: MovieSectionViewModelProtocol { get }
}

struct HomeViewModel: HomeViewModelProtocol {
    var popularMovieSection: MovieSectionViewModelProtocol
    var topRatedMovieSection: MovieSectionViewModelProtocol
    init() {
        popularMovieSection = PopularMovieSectionViewModel(movies: [])
        topRatedMovieSection = TopRatedMovieSectionViewModel(movies: [])
    }
}

extension HomeViewModel {
    init(popularSection: PopularMovieSectionViewModel?,
         topRatedSection: TopRatedMovieSectionViewModel?) {
        
        self.init()
        if let popularSection = popularSection {
            self.popularMovieSection = popularSection
        }
        if let topRatedSection = topRatedSection {
            self.topRatedMovieSection = topRatedSection
        }
    }
}
