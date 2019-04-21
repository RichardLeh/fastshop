//
//  MovieService.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

enum Endpoints {
    case popular
    case topRated
    case genre
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .topRated:
            return "movie/top_rated"
        case .genre:
            return "genre/movie/list"
        }
    }
}

protocol MovieServiceProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies, APIError>) -> Void)
    func fetchTopRatedMovies(page: Int, completion: @escaping (Result<TopRatedMovies, APIError>) -> Void)
    func fetchGenres(completion: @escaping (Result<Genres, APIError>) -> Void)
}

final class MovieService {
    let baseUrl = "\(Config.baseUrl)/\(Config.version)"
}

extension MovieService: MovieServiceProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies, APIError>) -> Void) {
        let request = Request(url: Endpoints.popular.path)
        request.get(completion: completion)
    }
    
    func fetchTopRatedMovies(page: Int, completion: @escaping (Result<TopRatedMovies, APIError>) -> Void) {
        let request = Request(url: Endpoints.topRated.path)
        request.get(completion: completion)
    }
    
    func fetchGenres(completion: @escaping (Result<Genres, APIError>) -> Void) {
        let request = Request(url: Endpoints.genre.path)
        request.get(completion: completion)
    }
}
