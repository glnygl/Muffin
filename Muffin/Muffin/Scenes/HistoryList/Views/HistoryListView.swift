//
//  HistoryListView.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

final class HistoryListView: BaseXibView, BaseViewProtocol {
    typealias ViewModelType = HistoryListViewModel
    typealias ControllerType = HistoryListController
    var viewModel: HistoryListViewModel?
    weak var controller: HistoryListController?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(types: [.HistoryListTableCell])
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
        }
    }
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func setupView() {
        animateLoading(isAnimating: false)
    }
    
    func viewModelDidSet() {
        guard let vc = self.viewModel?.controller else { return }
        vc.title = Constants.historyListTitle
    }
    
    func animateLoading(isAnimating: Bool) {
        loadingView.isHidden = !isAnimating
        if isAnimating {
         loadingView.startAnimating()
        } else {
         loadingView.stopAnimating()
        }
    }
}

extension HistoryListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else { return 0 }
        if vm.historyData != nil {
          return HistorySectionNumber.allCases.count
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HistorySectionType.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        guard let vm = self.viewModel else { return rowCount }
        if section == HistorySectionNumber.events.rawValue, let events = vm.historyData?.events {
            rowCount = events.count
        } else if section == HistorySectionNumber.births.rawValue, let births = vm.historyData?.births {
            rowCount = births.count
        } else if section == HistorySectionNumber.deaths.rawValue, let deaths = vm.historyData?.deaths {
            rowCount = deaths.count
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vm = self.viewModel, let cell = tableView.dequeue(type: CellType.HistoryListTableCell.rawValue, indexPath: indexPath) as? HistoryListTableCell  else { return UITableViewCell() }
        let section = indexPath.section
        var model: History?
        if section == HistorySectionNumber.events.rawValue, let events = vm.historyData?.events {
            model = events[indexPath.row]
        } else if section == HistorySectionNumber.births.rawValue, let births = vm.historyData?.births {
            model = births[indexPath.row]
        } else if section == HistorySectionNumber.deaths.rawValue, let deaths = vm.historyData?.deaths {
            model = deaths[indexPath.row]
        }
        cell.assign(model: model)
        return cell
    }
    
    
}
