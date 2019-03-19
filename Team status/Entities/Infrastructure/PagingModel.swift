//
//  PagingModel.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct PagingModel {
    
    let hasPrevious: Bool
    let hasNext: Bool
    var page: Int

    init?(json: JSON) {
        guard let page = json["page"].int else { return nil }
        self.page = page
        self.hasPrevious = json["has_previous"].boolValue
        self.hasNext = json["has_next"].boolValue
    }

    init() {
        self.hasPrevious = false
        self.hasNext = false
        self.page = 1
    }
}

extension PagingModel {
    static var initial = PagingModel()
}
