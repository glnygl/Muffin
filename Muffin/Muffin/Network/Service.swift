//
//  Service.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

final class Service {
    
    static func getModel<T: Codable>(urlRequest: URLRequest, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
              completion(nil)
            }else{
                guard let data = data, let model: T = data.decode() else{
                    completion(nil)
                    return
                }
                completion(model)
            }
        }.resume()
    }
    
    static func getURLRequest(requestType: APIConfig) -> URLRequest? {
        return requestType.asURLRequest()
    }
    
}
