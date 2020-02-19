//
//  UIView+Extensions.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

extension UIView{

    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName , bundle: bundle)
        
        let cview = nib.instantiate(withOwner: self, options: nil).first as? UIView
        cview?.frame = self.bounds
        cview?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return cview
    }
    
}
