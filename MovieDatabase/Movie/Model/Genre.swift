//
//  Genre.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let genreId: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case genreId = "id"
        case name
    }
}
