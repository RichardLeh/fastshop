//
//  Request.swift
//  Movie
//
//  Created by Richard Leh on 16/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Alamofire
import Foundation

struct Request {
    
    init() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=885c51f0e78055e8164c324b76fec8f9&language=en-US&page=1"
        
        Alamofire.request(urlString).responseData { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(PopularMovies.self, from: response.data!)
                    print(model)
                    print(model.totalPages)
                } catch let err {
                    print("Error: \(err)")
                }
            }
        }
    }
}
