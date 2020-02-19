//
//  BaseXibView.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

class BaseXibView: UIView {
    
    var contentView: UIView?
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeXib()
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeXib()
        self.setupView()
    }
    
    private func initializeXib() {
        guard let view = self.loadViewFromNib() else { return }
        self.addSubview(view)
        self.contentView = view
    }
    
    func setupView() {}
    
}
