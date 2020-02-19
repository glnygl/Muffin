//
//  Config.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct Keys {
    static let baseURL = "http://history.muffinlabs.com"
}

enum APIConfig {
    
    case getHistory
    
    private var method: HTTPMethod {
        switch self {
        case .getHistory:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getHistory:
            return "/date"
        }
    }
    
    private var query: String? {
        switch self {
        case .getHistory:
            return nil
        }
    }
    
    private var params: [String: String]? {
        switch self {
        case .getHistory:
            return nil
        }
    }
    
    
    func asURLRequest() -> URLRequest? {
        if let url = URL(string: Keys.baseURL) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path + (query ?? "")))
            urlRequest.httpMethod = method.rawValue
            if let parameters = params {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    return nil
                }
            }
            return urlRequest
        } else {
           return nil
        }
    }
}
