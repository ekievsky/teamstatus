//
//  Project.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct Project {
    
    let id: Int
    let projectName: String

    init?(json: JSON) {
        guard let id = json["id"].int else { return nil }
        self.id = id
        self.projectName = json["project_name"].stringValue
    }
}
