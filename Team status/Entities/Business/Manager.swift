//
//  Manager.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct Manager {
    
    let id: Int
    let lastName: String
    let firstName: String

    init?(json: JSON) {
        guard let id = json["id"].int else { return nil }
        self.id = id
        self.lastName = json["last_name"].stringValue
        self.firstName = json["first_name"].stringValue
    }
}
