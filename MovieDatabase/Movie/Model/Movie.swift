//
//  Movie.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

class Movie: Codable {
    
    var movieId: Int64!
    var title: String = ""
    var genres: [Int] = []
    var overview: String = ""
    var release: String?
    var posterPath: String?
    var dateAddedToFavorites: Date?
    var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case genres = "genre_ids"
        case release = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        
        case title
        case overview
        case dateAddedToFavorites
    }

}
