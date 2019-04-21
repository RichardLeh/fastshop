//
//  MovieServiceMock.swift
//  MovieTests
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

@testable import Movie

class MovieServiceMock: MovieServiceProtocol {
    
    var fetchPopularMoviesHasBeenCalled = false
    var fetchTopRatedMoviesHasBeenCalled = false
    var fetchGenresHasBeenCalled = false
    
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies, APIError>) -> Void) {
        fetchPopularMoviesHasBeenCalled = true
    }
    func fetchTopRatedMovies(page: Int, completion: @escaping (Result<TopRatedMovies, APIError>) -> Void) {
        fetchTopRatedMoviesHasBeenCalled = true
    }
    func fetchGenres(completion: @escaping (Result<Genres, APIError>) -> Void) {
        fetchGenresHasBeenCalled = true
    }
}
