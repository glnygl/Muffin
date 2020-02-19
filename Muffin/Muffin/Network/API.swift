//
//  API.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

typealias HistoryDataHandler = (HistoryData?) -> Void

final class API {

    static func fetchHistory(completion: @escaping HistoryDataHandler) {
        if let urlRequest = Service.getURLRequest(requestType: .getHistory) {
            Service.getModel(urlRequest: urlRequest) { (result: HistoryList?) in
                completion(result?.data)
            }
        }else {
          completion(nil)
        }
    }
    
}



