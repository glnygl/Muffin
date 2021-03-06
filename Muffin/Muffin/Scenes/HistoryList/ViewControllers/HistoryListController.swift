//
//  HistoryListController.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class HistoryListController: BaseViewController {
    
    let viewModel = HistoryListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setViewModel(controller: self) {
            viewModel.fetchHistories()
        }
    }

}

