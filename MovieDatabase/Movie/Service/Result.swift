//
//  Result.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

enum Result<T, E: Error> {
    case success(T)
    case error(E)
}

typealias Response<T: Decodable> = (Result<T, APIError>) -> Void
