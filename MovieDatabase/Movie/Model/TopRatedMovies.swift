//
//  TopRatedMovies.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

final class TopRatedMovies: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
