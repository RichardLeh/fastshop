//
//  Movie.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation
import UIKit

class Movie: Codable {
    
    var movieId: Int64!
    var title: String = ""
    var genres: [Int] = []
    var overview: String = ""
    var release: String?
    var posterPath: String?
    var dateAddedToFavorites: Date?
    var backdropPath: String?
    
    var posterImage: UIImage?
    lazy var posterURL: URL? = {
        guard let path = posterPath else {
            return URL(string: "")
        }
        
        return URL(string: "https://image.tmdb.org/t/p/w300\(path)")
    }()
    
    lazy var genreFirst: String = {
        guard let firstGenrer = Genres.shared.getNames(genres).first else {
            return ""
        }
        
        return firstGenrer
    }()
    
    lazy var genreListName: String = {
        let movieGenres = Genres.shared.getNames(genres)
        return movieGenres.joined(separator: ",")
    }()
    
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
