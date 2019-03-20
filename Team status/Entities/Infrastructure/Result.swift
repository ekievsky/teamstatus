//
//  Result.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 1/25/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(TSError)
}

// MARK: - Debug purposes
extension Result: CustomStringConvertible {

    var description: String {
        switch self {
        case .success(let value):
            return ".success(\(value))"
        case .failure(let error):
            return ".failure(\(error))"
        }
    }

    var value: T? {
        switch self {
        case .success(let val):
            return val
        case .failure:
            return nil
        }
    }
}
