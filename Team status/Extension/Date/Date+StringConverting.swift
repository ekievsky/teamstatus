//
//  Date+StringConverting.swift
//  Forecast
//
//  Created by Evgenii Kyivskyi on 1/25/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import Foundation

extension Date {
    
    var fullDateString: String {
        return DateFormatter.fullDateTime.string(from: self)
    }

    var time: String {
        return DateFormatter.time.string(from: self).lowercased()
    }

    var fullDay: String {
        return DateFormatter.fullDay.string(from: self)
    }
}
