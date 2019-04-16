//
//  Error.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

enum APIError: Error {
    case invalidData
    case parseError(String)
}
