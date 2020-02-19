//
//  UITableView+Extensions.swift
//  Muffin
//
//  Created by Gülenay Gül on 19.02.2020.
//  Copyright © 2020 glnygl. All rights reserved.
//

import UIKit

extension UITableView {
   
    func register(types : [CellType]) {
        types.forEach { (type) in
            let nib = UINib(nibName: type.rawValue, bundle: nil)
            self.register(nib, forCellReuseIdentifier: type.rawValue)
        }
    }
    
    func dequeue<T : UITableViewCell>(type : String, indexPath : IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type, for: indexPath) as! T
    }
    
}
