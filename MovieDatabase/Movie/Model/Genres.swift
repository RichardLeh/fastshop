//
//  Genres.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation

final class Genres: Codable {
    static var shared = Genres()
    var genres: [Genre]?
}

extension Genres {
    func fetchGenres() {
        let service = MovieService()
        service.fetchGenres { result in
            switch result {
            case .success(let response):
                Genres.shared = response
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNames(_ genresIds: [Int]) -> [String] {
        guard let genres = genres else {
            return []
        }
        
        return genresNames(genres, genresIds: genresIds)
    }
    private func genresNames(_ genres: [Genre], genresIds: [Int]) -> [String] {
        let names = genres.compactMap { genre -> String? in
            if genresIds.contains(genre.genreId) {
                return genre.name
            }
            
            return nil
        }
        
        return names
    }

}
