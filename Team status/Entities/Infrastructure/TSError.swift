//
//  TSError.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

enum TSError: Int {

    case generalError = 0
    case parseError
    case noInternetConnection
}

extension TSError: Error {
    
    var localizedDescription: String {
        switch self {
        case .generalError:
            return "Something went wrong"
        case .parseError:
            return "Received data could be read"
        case .noInternetConnection:
            return "The internet connection seems to be offline"
        }
    }
}
