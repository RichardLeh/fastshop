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

    private(set) var urlString: String
    
    init(url: String) {
        urlString = "\(Config.baseUrl)\(Config.version)/\(url)?api_key=\(Config.apiKey)"
    }
    
    func get<T: Decodable>(completion: @escaping Response<T>) {
        
        Alamofire.request(urlString).responseData { response in
            
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                } catch let err {
                    print("Error: \(err)")
                    DispatchQueue.main.async {
                        completion(.error(APIError.parseError(err.localizedDescription)))
                    }
                }
            }
        }
    }
}
