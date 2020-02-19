//
//  Data+Extensions.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

extension Data {
    
    func decode<T: Codable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    
}
