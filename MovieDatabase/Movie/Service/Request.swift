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
    
    private enum HTTPMethod: String {
    case get = "GET"
    }
    
    private(set) var urlString: String
    
    init(url: String) {
        urlString = "\(Config.baseUrl)\(Config.version)/\(url)?api_key=\(Config.apiKey)"
    }
    
    func get<T: Decodable>(completion: @escaping Response<T>) {
        
        Alamofire.request(urlString).responseData { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(T.self, from: response.data!)
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
