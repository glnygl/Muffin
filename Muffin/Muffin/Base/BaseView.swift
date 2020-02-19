//
//  BaseView.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import Foundation

protocol BaseViewProtocol {
    associatedtype ViewModelType
    associatedtype ControllerType
    var viewModel: ViewModelType? { get set }
    var controller: ControllerType? { get set }
    func viewModelDidSet()
}

extension BaseViewProtocol {
    func viewModelDidSet() {}
}
