//
//  DateFormatter.swift
//  Forecast
//
//  Created by Evgenii Kyivskyi on 1/24/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let fullDateTime: DateFormatter = {
        return DateFormatter.dateFormatter(withFormat: fullDateTimeFormat)
    }()

    static let time: DateFormatter = {
        return DateFormatter.dateFormatter(withFormat: timeFormat)
    }()

    static let fullDay: DateFormatter = {
        return DateFormatter.dateFormatter(withFormat: fullDayFormat)
    }()

    static func dateFormatter(withFormat format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}

extension DateFormatter {
    static let fullDateTimeFormat = "E MMM dd yyyy HH:mm:ss"
    static let timeFormat = "Ha"
    static let fullDayFormat = "dd/MM/yyyy"
}
