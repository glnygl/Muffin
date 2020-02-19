//
//  HistoryListModel.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

struct HistoryList: Codable {
    let date: String?
    let data: HistoryData?
}

struct HistoryData: Codable {
    let events: [History]?
    let births: [History]?
    let deaths: [History]?
    
    enum CodingKeys: String, CodingKey {
        case events = "Events"
        case births = "Births"
        case deaths = "Deaths"
    }
}

struct History: Codable {
    let year: String?
    let text: String?
}
