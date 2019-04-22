//
//  UpcomingMovies.swift
//  Movie
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

final class UpcomingMovies: Codable {
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
