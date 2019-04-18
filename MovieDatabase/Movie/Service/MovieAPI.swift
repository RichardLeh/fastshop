//
//  MovieAPI.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

enum Endpoints {
    case popular
    case genre
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .genre:
            return "genre/movie/list"
        }
    }
}

final class MovieAPI {
    
    static let shared = MovieAPI()
    let baseUrl = "\(Config.baseUrl)/\(Config.version)"
}

extension MovieAPI: MovieServiceProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies, APIError>) -> Void) {
        let request = Request(url: Endpoints.popular.path)
        request.get(completion: completion)
    }
}
