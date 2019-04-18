//
//  MovieServiceProtocol.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<PopularMovies, APIError>) -> Void)
}
