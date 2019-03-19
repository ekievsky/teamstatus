//
//  Skill.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct Skill {
    
    let name: String

    init(json: JSON) {
        self.name = json["name"].stringValue
    }
}
