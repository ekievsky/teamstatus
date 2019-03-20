//
//  UIView+Graphic.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyShadow() {
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor
        backgroundColor = .white
        layer.cornerRadius = 8
    }
}
