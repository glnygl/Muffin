//
//  HistoryListViewModel.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class HistoryListViewModel: BaseViewModelProtocol {
    typealias ViewType = HistoryListView
    typealias ControllerType = HistoryListController
    var view: HistoryListView?
    weak var controller: HistoryListController?
    
    var historyData: HistoryData? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view?.tableView.reloadData()
            }
        }
    }
    
    func setViewModel(controller: BaseViewController, viewLoadComplete: () -> Void) {
        guard let controller = controller as? HistoryListController,
            let view = controller.view as? HistoryListView else { return }
        view.viewModel = self
        view.controller = controller
        self.controller = controller
        self.view = view
        view.viewModelDidSet()
        viewLoadComplete()
    }
    
    func fetchHistories() {
        guard let view = view else { return }
        view.animateLoading(isAnimating: true)
        API.fetchHistory { [weak self] (response) in
            DispatchQueue.main.async { [weak view] in
                view?.animateLoading(isAnimating: false)
            }
            if response != nil {
                self?.historyData = response
            }
        }
    }
    
    
}
