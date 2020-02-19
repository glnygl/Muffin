//
//  Enums.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

enum CellType: String {
    case HistoryListTableCell
}

enum HistorySectionNumber: Int, CaseIterable {
    case events
    case births
    case deaths
    
    static var allCases: [HistorySectionNumber] {
        return [.events, .births, .deaths]
    }
}

enum HistorySectionType: String {
    case events = "Events"
    case births = "Births"
    case deaths = "Deaths"
    
    static var allCases: [HistorySectionType] {
        return [.events, .births, .deaths]
    }
}

enum Constants {
    static let historyListTitle = "Muffin"
}
