//
//  WorkingHour.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct WorkingHours {
    
    let timezone: String
    let end: Date
    let start: Date

    init(json: JSON) {
        self.timezone = json["project_name"].stringValue
        self.end = json["end"].stringValue.fullDate ?? Date()
        self.start = json["start"].stringValue.fullDate ?? Date()
    }
}
