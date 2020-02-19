//
//  HistoryListTableCell.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

class HistoryListTableCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func assign(model: History?) {
        if let model = model {
            yearLabel.text = model.year
            descriptionLabel.text = model.description
        }
    }
    
}
