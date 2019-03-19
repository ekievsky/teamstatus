//
//  String+DateConverting.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 2/11/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

extension String {
    
    var fullDate: Date? {
        return DateFormatter.fullDateTime.date(from: self)
    }
}
